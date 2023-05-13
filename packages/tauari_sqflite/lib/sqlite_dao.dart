part of tauari_sqflite;

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
      limit: queryArgs?.limit,
      where: queryArgs?.where,
      whereArgs: queryArgs?.whereArgs,
      groupBy: queryArgs?.groupBy,
      having: queryArgs?.having,
      offset: queryArgs?.offset,
      distinct: queryArgs?.distinct,
    );
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
  Future<int> insert(Map<String, Object?> item) async {
    final id = await database.db!.insert(tableName, item);
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
}
