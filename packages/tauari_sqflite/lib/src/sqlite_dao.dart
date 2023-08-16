import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

abstract class SqliteDao extends Dao {
  SqliteDao({required this.database, required this.tableName});
  final LocalDatabase<Database> database;
  final String tableName;
  @override
  Future<Iterable<Map<String, Object?>>> rawQuery(String sql,
      [List<Object?>? arguments]) async {
    return await database.db!.rawQuery(sql, arguments);
  }

  @override
  Future<Iterable<Map<String, Object?>>> data([QueryArgs? queryArgs]) async {
    return await database.db!.query(
      tableName,
      orderBy: queryArgs?.orderBy, //?? '${ColumnChart.lastViewed} DESC',
      limit: queryArgs?.limitLocal,
      where: queryArgs?.where,
      whereArgs: queryArgs?.whereArgs,
      groupBy: queryArgs?.groupBy,
      having: queryArgs?.having,
      offset: queryArgs?.offset,
      distinct: queryArgs?.distinct,
    );
    // return result;
    // if (queryArgs?.limitDisplay != null) {
    //   final limitAllowed = queryArgs!.limitDisplay! > result.length
    //       ? result.length
    //       : queryArgs.limitDisplay!;
    //   return result.getRange(0, limitAllowed);
    // } else {
    //   return result;
    // }
  }

  @override
  Future<Map<String, Object?>?> byId(int id) async {
    final list = await database.db!
        .query(tableName, where: '$columnId = ?', whereArgs: <Object?>[id]);
    if (list.isNotEmpty) {
      return list.first;
    }
    return null;
  }

  // Future<Iterable<Map<String, Object?>>> data([QueryArgs? queryArgs]);
  @override
  Stream<Iterable<Map<String, Object?>>> onData([QueryArgs? queryArgs]) {
    return onDataFromFuture(() => data(queryArgs));
    // late StreamController<Iterable<Map<String, Object?>>> ctlr;

    // StreamSubscription? triggerSubscription;
    // Future<void> sendUpdate() async {
    //   final items = await data(queryArgs);
    //   if (!ctlr.isClosed) {
    //     ctlr.add(items);
    //   }
    // }

    // ctlr = StreamController<Iterable<Map<String, Object?>>>(onListen: () {
    //   sendUpdate();
    //   triggerSubscription = database.updateTriggerController.stream.listen((_) {
    //     sendUpdate();
    //   });
    // }, onCancel: () {
    //   triggerSubscription?.cancel();
    // });
    // return ctlr.stream.asBroadcastStream(
    //   onCancel: ((subscription) => subscription.pause()),
    //   onListen: (subscription) => subscription.resume(),
    // );
  }

  @override
  Stream<Iterable<Map<String, Object?>>> onDataFromFuture(
      Future<Iterable<Map<String, Object?>>> Function() data) {
    late StreamController<Iterable<Map<String, Object?>>> ctlr;

    StreamSubscription? triggerSubscription;
    Future<void> sendUpdate() async {
      final items = await data();
      if (!ctlr.isClosed) {
        ctlr.add(items);
      }
    }

    ctlr = StreamController<Iterable<Map<String, Object?>>>(onListen: () {
      sendUpdate();
      triggerSubscription = database.updateTriggerController.stream.listen((_) {
        sendUpdate();
      });
    }, onCancel: () {
      triggerSubscription?.cancel();
    });
    return ctlr.stream.asBroadcastStream(
      onCancel: ((subscription) => subscription.pause()),
      onListen: (subscription) => subscription.resume(),
    );
  }

  @override
  Future<void> insertMany(
    Iterable<Map<String, Object?>> items, {
    bool refreshDb = true,
  }) async {
    await database.db!.transaction((txn) async {
      final batch = txn.batch();
      for (var item in items) {
        batch.insert(
          tableName,
          item,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      try {
        await batch.commit(continueOnError: true);
      } catch (_) {}
    });
    if (refreshDb) {
      database.triggerUpdate();
    }
  }

  @override
  Future<int> insert(Map<String, Object?> item) async {
    final id = await database.db!.transaction<int>((txn) async {
      return await txn.insert(
        tableName,
        item,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
    // final id = await database.db!.insert(
    //   tableName,
    //   item,
    //   conflictAlgorithm: ConflictAlgorithm.replace,
    // );
    database.triggerUpdate();
    return id;
  }

  // Future<int> doInsert(DatabaseExecutor db, Map<String, Object?> item);
  @override
  Future<int> delete(int itemId) async {
    final rows = await database.db!
        .delete(tableName, where: '$columnId = ?', whereArgs: [itemId]);
    database.triggerUpdate();
    return rows;
  }

  @override
  Future<int> deleteWhere(String where, List<Object?> whereArgs) async {
    final rows = await database.db!
        .delete(tableName, where: where, whereArgs: whereArgs);
    database.triggerUpdate();
    return rows;
  }

  // Future doDelete(DatabaseExecutor db, int itemId);
  @override
  Future<int> update(Map<String, Object?> item) async {
    final rows = await database.db!.update(tableName, item,
        where: '$columnId = ?', whereArgs: [item[columnId]]);
    database.triggerUpdate();
    return rows;
  }

  // Future doUpdate(DatabaseExecutor db, Map<String, Object?> item);
  @override
  Stream<int> onCount() {
    late StreamController<int> ctrl;
    StreamSubscription? triggerSubscription;
    Future<void> sendUpdate() async {
      final count = await this.count();
      if (!ctrl.isClosed) {
        ctrl.add(count);
      }
    }

    ctrl = StreamController<int>(onListen: () {
      sendUpdate();
      triggerSubscription = database.updateTriggerController.stream.listen((_) {
        sendUpdate();
      });
    }, onCancel: () {
      triggerSubscription?.cancel();
    });
    return ctrl.stream;
  }

  @override
  Future<int> count() async {
    return Sqflite.firstIntValue(
            await database.db!.rawQuery('SELECT COUNT(*) FROM $tableName')) ??
        0;
  }

  @override
  Stream<Map<String, Object?>?> onById(int itemId) {
    return onItemFromFuture(() => byId(itemId));
  }

  @override
  Stream<Map<String, Object?>?> onItemFromFuture(
      Future<Map<String, Object?>?> Function() data) {
    late StreamController<Map<String, Object?>?> ctlr;

    StreamSubscription? triggerSubscription;
    Future<void> sendUpdate() async {
      final items = await data();
      if (!ctlr.isClosed) {
        ctlr.add(items);
      }
    }

    ctlr = StreamController<Map<String, Object?>?>(onListen: () {
      sendUpdate();
      triggerSubscription = database.updateTriggerController.stream.listen((_) {
        sendUpdate();
      });
    }, onCancel: () {
      triggerSubscription?.cancel();
    });
    return ctlr.stream.asBroadcastStream(
      onCancel: ((subscription) => subscription.pause()),
      onListen: (subscription) => subscription.resume(),
    );
  }

  @override
  void refreshDatabase() => database.triggerUpdate();

  @override
  Future<void> updateManyOnLocal(Iterable<Map<String, Object?>> items,
      {bool refreshDb = true}) async {
    await database.db!.transaction((txn) async {
      final batch = txn.batch();
      for (var item in items) {
        batch.update(
          tableName,
          item,
          where: '$columnId=?',
          whereArgs: [item[columnId]],
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }
      try {
        await batch.commit(continueOnError: true);
      } catch (_) {}
    });
    if (refreshDb) {
      database.triggerUpdate();
    }
  }
}
