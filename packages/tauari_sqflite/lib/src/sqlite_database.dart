import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class SqliteDatabase extends LocalDatabase<Database> {
  final lock = Lock(reentrant: true);
  final DatabaseFactory dbFactory;
  final Future<void> Function(Database db)? onCreated;
  final FutureOr<void> Function(Database db)? onConfigure;
  final FutureOr<void> Function(Database db)? onUpgrade;
  // final updateTriggerController = StreamController<bool>.broadcast();
  // Database? db;
  // final dbVersion = 1;
  // final dbName = 'lasotuvi_v1_2.db';

  SqliteDatabase(
    this.dbFactory, {
    this.onCreated,
    this.onConfigure,
    this.onUpgrade,
    required super.databaseName,
  });

  @override
  Future<Database?> get ready async => db ??= await lock.synchronized(() async {
        if (db == null) {
          await open();
        }
        return db;
      });

  @override
  Future open() async {
    await openPath(await _fixPath(databaseName));
  }

  @override
  Future openPath(String path) async {
    db = await dbFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: dbVersion,
        onCreate: (db, version) async {
          await _createDb(db);
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          if (oldVersion < dbVersion) {
            await _onUpgrade(db);
          } else {
            await _createDb(db);
          }
        },
        onConfigure: _onConfigure,
      ),
    );
  }

  FutureOr<void> _onConfigure(Database db) async {
    if (onConfigure != null) {
      await onConfigure!(db);
    }
  }

  Future<void> _createDb(Database db) async {
    if (onCreated != null) {
      await onCreated!(db);
    }
  }

  FutureOr<void> _onUpgrade(Database db) async {
    if (onUpgrade != null) {
      await onUpgrade!(db);
    }
  }

  @override
  Future close() async {
    await db?.close();
  }

  @override
  Future deleteDb() async {
    await dbFactory.deleteDatabase(await _fixPath(databaseName));
  }

  Future _fixPath(String path) async => join(await getDatabasesPath(), path);

  @override
  int get dbVersion => 1;

  static Future<Database> openOtherDatabase(String name) async {
    return await openDatabase(join(await getDatabasesPath(), name));
  }

  static Future<bool> exists(String name) async {
    final path = join(await getDatabasesPath(), name);
    final file = File(path);
    return await file.exists();
  }

  // void triggerUpdate() {
  //   updateTriggerController.sink.add(true);
  // }

  // Future<Charts> getListCharts({int? limit}) async {
  //   final list =
  //       await db!.query(tableCharts, orderBy: 'lastViewed DESC', limit: limit);
  //   return Charts(list);
  // }

  // Stream<List<ChartEntity?>> onCharts({int? limit}) {
  //   late StreamController<Charts> ctlr;
  //   StreamSubscription? triggerSubscription;
  //   Future<void> sendUpdate() async {
  //     final items = await getListCharts(limit: limit);
  //     if (!ctlr.isClosed) {
  //       ctlr.add(items);
  //     }
  //   }

  //   ctlr = StreamController<Charts>(onListen: () {
  //     sendUpdate();
  //     triggerSubscription = _updateTriggerController.stream.listen((_) {
  //       sendUpdate();
  //     });
  //   }, onCancel: () {
  //     triggerSubscription?.cancel();
  //   });
  //   return ctlr.stream;
  // }
}
