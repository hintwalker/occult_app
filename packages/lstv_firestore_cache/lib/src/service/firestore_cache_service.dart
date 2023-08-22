import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lstv_firestore_cache/src/query/query_from_map.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

abstract class FirestoreCacheService extends CloudService {
  final updateTriggerController = StreamController<bool>.broadcast();
  CollectionBox<Map>? box;
  final FutureOr<bool> Function() availableNetwork;
  FirestoreCacheService({
    this.box,
    required this.availableNetwork,
  });

  void setBox(CollectionBox<Map>? box) {
    this.box = box;
  }

  // @override
  // Future<dynamic> addToCollection(
  //     {required Map<String, dynamic> data,
  //     required String collectionPath,
  //     required bool refresh}) async {

  //   if (refresh) {
  //     triggerUpdate();
  //   }
  // }

  @override
  Stream<int> countDocuments(String collectionPath) {
    late StreamController<int> ctlr;

    StreamSubscription? triggerSubscription;
    Future<void> sendUpdate() async {
      if (kDebugMode) {
        print('[cache] countDocuments');
      }
      final items = await getFromCollection(collectionPath: collectionPath);
      if (!ctlr.isClosed) {
        ctlr.add(items?.length ?? 0);
      }
    }

    ctlr = StreamController<int>(onListen: () {
      sendUpdate();
      triggerSubscription = updateTriggerController.stream.listen((_) {
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
  Future<bool> deleteDocumentFromCollection(
      {required String collectionPath,
      required String docId,
      required bool online,
      required bool refresh}) async {
    if (kDebugMode) {
      print('[cache] deleteDocumentFromCollection');
    }
    // final uid = uidFromCollectionPath(collectionPath);
    // if (uid == null) {
    //   return false;
    // }
    // final item = await box?.get(uid);
    // if (item == null) {
    //   return false;
    // }
    // item.removeWhere((key, value) => key == docId);
    await box?.delete(docId);
    if (refresh) {
      triggerUpdate();
    }
    return true;
  }

  @override
  Future<bool> exists(
      {required String collectionPath,
      required String docId,
      required bool online}) async {
    // final uid = uidFromCollectionPath(collectionPath);
    // if (uid == null) {
    //   return false;
    // }
    // final collection = await box?.get(uid);
    // final item = collection?[docId];
    // if (item == null) {
    //   return false;
    // }
    final item = await box?.get(docId);
    return item != null;
  }

  @override
  Future<Map<String, Map<dynamic, dynamic>>?> getFromCollection(
      {required String collectionPath,
      CloudDataOrderBy? orderBy,
      int? limit,
      CloudDataWhere? where}) async {
    if (kDebugMode) {
      print('[cache] getFromCollection');
    }
    // final uid = uidFromCollectionPath(collectionPath);
    // if (uid == null) {
    //   return null;
    // }
    final allData = await box?.getAllValues();
    if (allData == null) {
      return null;
    }
    final result = queryFromMap(
      collection: allData,
      orderBy: orderBy,
      limit: limit,
      where: where,
    );
    return result;
  }

  @override
  Future<Map<dynamic, dynamic>?> getFromDocument(
      {required String collectionPath,
      required String docId,
      required bool online}) async {
    // final uid = uidFromCollectionPath(collectionPath);
    // if (uid == null) {
    //   return null;
    // }
    final value = await box?.get(docId);
    return {docId: value};
  }

  @override
  Stream getSnapshotStreamFromCollection(
      {required String collectionPath,
      CloudDataOrderBy? orderBy,
      int? limit,
      CloudDataWhere? where}) {
    late StreamController<Map<String, Map<dynamic, dynamic>>?> ctlr;

    StreamSubscription? triggerSubscription;
    Future<void> sendUpdate() async {
      final items = await getFromCollection(
        collectionPath: collectionPath,
        orderBy: orderBy,
        limit: limit,
        where: where,
      );
      if (!ctlr.isClosed) {
        ctlr.add(items);
      }
    }

    ctlr = StreamController<Map<String, Map<dynamic, dynamic>>?>(onListen: () {
      sendUpdate();
      triggerSubscription = updateTriggerController.stream.listen((_) {
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
  Stream getSnapshotStreamFromDocument({
    required String collectionPath,
    required String docId,
    required bool online,
  }) {
    late StreamController<Map<dynamic, dynamic>?> ctlr;

    StreamSubscription? triggerSubscription;
    Future<void> sendUpdate() async {
      final item = await getFromDocument(
        collectionPath: collectionPath,
        online: online,
        docId: docId,
      );
      if (!ctlr.isClosed) {
        ctlr.add(item);
      }
    }

    ctlr = StreamController<Map<dynamic, dynamic>?>(onListen: () {
      sendUpdate();
      triggerSubscription = updateTriggerController.stream.listen((_) {
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
  Future<void> setDataOnDocument({
    required Map<String, dynamic> data,
    required String collectionPath,
    required String doc,
    required bool refresh,
  }) async {
    if (kDebugMode) {
      print('[cache] setDataOnDocument');
    }
    // final uid = uidFromCollectionPath(collectionPath);
    // if (uid == null) {
    //   return;
    // }
    await box?.put(doc, data);
    if (refresh) {
      triggerUpdate();
    }
  }

  @override
  Future<void> setToCollection(
      {required String key,
      required Map<String, dynamic> data,
      required String collectionPath,
      required bool refresh}) async {
    if (kDebugMode) {
      print('[cache] setToCollection');
    }
    // final uid = uidFromCollectionPath(collectionPath);
    // if (uid == null) {
    //   return;
    // }
    // for (var item in data.entries) {
    //   await box?.put(item.key, item.value);
    // }
    await box?.put(key, data);
    if (refresh) {
      triggerUpdate();
    }
  }

  @override
  void triggerUpdate() {
    if (kDebugMode) {
      print('[cache] refresh cache');
    }
    updateTriggerController.sink.add(true);
  }

  @override
  Future<void> updateDataOnDocument({
    required Map<String, dynamic> data,
    required String collectionPath,
    required String docId,
    required bool refresh,
  }) async {
    await setDataOnDocument(
      data: data,
      collectionPath: collectionPath,
      doc: docId,
      refresh: refresh,
    );
  }
}
