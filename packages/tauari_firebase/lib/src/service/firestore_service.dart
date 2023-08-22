import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_utils/tauari_utils.dart';
// import 'package:tauari_utils/tauari_utils.dart';

class FirestoreService implements CloudService {
  FirestoreService(
    this.firestore, {
    required this.availableNetwork,
  });

  final FutureOr<bool> Function() availableNetwork;

  final updateTriggerController = StreamController<bool>.broadcast();

  final FirebaseFirestore firestore;

  @override
  void triggerUpdate() {
    if (kDebugMode) {
      printWarning('[FIRESTORE] refresh cloud');
    }
    updateTriggerController.sink.add(true);
  }

  /// Collection Operations

  // @override
  // Future<DocumentReference<Map<String, dynamic>>> addToCollection({
  //   required Map<String, dynamic> data,
  //   required String collectionPath,
  //   required bool refresh,
  // }) async {
  //   final result = await firestore.collection(collectionPath).add(data);
  //   if (refresh) {
  //     triggerUpdate();
  //   }

  //   return result;
  // }

  Future<void> createEmptyCollection({required String collectionPath}) async {
    final collection = firestore.collection(collectionPath);
    collection.doc().set({});
  }

  @override
  Future<void> setToCollection({
    required String key,
    required Map<String, dynamic> data,
    required String collectionPath,
    required bool refresh,
  }) async {
    if (kDebugMode) {
      printWarning('[FIRESTORE] setToCollection $collectionPath: $data');
    }
    firestore.collection(collectionPath).doc(key).set(data);
    if (refresh) {
      triggerUpdate();
    }
  }

  Query<Map<String, dynamic>> _buildQuery(
      {required CollectionReference<Map<String, dynamic>> collection,
      CloudDataOrderBy? orderBy,
      int? limit,
      CloudDataWhere? where}) {
    Query<Map<String, dynamic>>? result;

    if (where != null) {
      result = collection.where(
        where.field,
        isEqualTo: where.isEqualTo,
        isNotEqualTo: where.isNotEqualTo,
        isGreaterThan: where.isGreaterThan,
        isGreaterThanOrEqualTo: where.isGreaterThanOrEqualTo,
        isLessThan: where.isLessThan,
        isLessThanOrEqualTo: where.isLessThanOrEqualTo,
        arrayContains: where.arrayContains,
        arrayContainsAny: where.arrayContainsAny,
        whereIn: where.whereIn,
        whereNotIn: where.whereNotIn,
        isNull: where.isNull,
      );
    }

    if (limit != null) {
      if (result == null) {
        result = collection.orderBy(FieldPath.documentId).limit(limit);
      } else {
        result = result.orderBy(FieldPath.documentId).limit(limit);
      }
    } else {
      if (orderBy != null) {
        if (result == null) {
          result =
              collection.orderBy(orderBy.field, descending: orderBy.descending);
        } else {
          result =
              result.orderBy(orderBy.field, descending: orderBy.descending);
        }
      } else {
        if (result == null) {
          result = collection.orderBy(FieldPath.documentId);
        } else {
          result = result.orderBy(FieldPath.documentId);
        }
      }
    }

    return result;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getFromCollection(
      {required String collectionPath,
      CloudDataOrderBy? orderBy,
      int? limit,
      CloudDataWhere? where}) async {
    if (kDebugMode) {
      printWarning('[FIRESTORE] getFromCollection $collectionPath');
    }
    var collection = firestore.collection(collectionPath);
    final online = await availableNetwork();
    if (orderBy == null && limit == null && where == null) {
      return collection.get(
        GetOptions(
          source: online ? Source.serverAndCache : Source.cache,
        ),
      );
    }
    final result = _buildQuery(
      collection: collection,
      orderBy: orderBy,
      limit: limit,
      where: where,
    );

    return await result.get(
      GetOptions(
        source: online ? Source.serverAndCache : Source.cache,
      ),
    );
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getSnapshotStreamFromCollection(
      {required String collectionPath,
      CloudDataOrderBy? orderBy,
      int? limit,
      CloudDataWhere? where}) {
    late StreamController<QuerySnapshot<Map<String, dynamic>>> ctlr;

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

    ctlr = StreamController<QuerySnapshot<Map<String, dynamic>>>(onListen: () {
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

  // @override
  // Stream<QuerySnapshot<Map<String, dynamic>>> getSnapshotStreamFromCollection(
  //     {required String collectionPath,
  //     CloudDataOrderBy? orderBy,
  //     int? limit,
  //     CloudDataWhere? where}) {
  //   var collection = firestore.collection(collectionPath);

  //   if (orderBy == null && limit == null && where == null) {
  //     return collection.snapshots(includeMetadataChanges: true);
  //   }
  //   final result = _buildQuery(
  //     collection: collection,
  //     orderBy: orderBy,
  //     limit: limit,
  //     where: where,
  //   );

  //   return result.snapshots(includeMetadataChanges: true);
  //   // return firestore
  //   //     .collection(collectionPath)
  //   //     .orderBy(orderField, descending: descending)
  //   //     .limit(limit)
  //   //     .snapshots();
  // }

  /// Document Operations

  @override
  Future<bool> deleteDocumentFromCollection({
    required String collectionPath,
    required String docId,
    required bool online,
    required bool refresh,
  }) async {
    if (kDebugMode) {
      printWarning('[FIRESTORE] deleteDocumentFromCollection');
    }
    final doc = firestore.collection(collectionPath).doc(docId);
    final data = await doc.get(
      GetOptions(
        source: online ? Source.serverAndCache : Source.cache,
      ),
    );
    if (data.exists) {
      await firestore.collection(collectionPath).doc(docId).delete();
      if (refresh) {
        triggerUpdate();
      }
      return true;
    }
    if (refresh) {
      triggerUpdate();
    }

    return false;
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getFromDocument({
    required String collectionPath,
    required String docId,
    required bool online,
  }) async {
    if (kDebugMode) {
      printWarning('[FIRESTORE] getFromDocument $collectionPath ($docId)');
    }
    return firestore.collection(collectionPath).doc(docId).get(
          GetOptions(
            source: online ? Source.serverAndCache : Source.cache,
          ),
        );
  }

  @override
  Future<void> setDataOnDocument({
    required Map<String, dynamic> data,
    required String collectionPath,
    required String doc,
    required bool refresh,
  }) async {
    final docRef = firestore.collection(collectionPath).doc(doc);
    if (kDebugMode) {
      printWarning('[FIRESTORE] setDataOnDocument');
    }
    await docRef.set(
      data,
    );
    if (refresh) {
      triggerUpdate();
    }
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getSnapshotStreamFromDocument({
    required String collectionPath,
    required String docId,
    required bool online,
  }) {
    late StreamController<DocumentSnapshot<Map<String, dynamic>>> ctlr;

    StreamSubscription? triggerSubscription;
    Future<void> sendUpdate() async {
      final item = await getFromDocument(
          collectionPath: collectionPath, online: online, docId: docId);
      if (!ctlr.isClosed) {
        ctlr.add(item);
      }
    }

    ctlr =
        StreamController<DocumentSnapshot<Map<String, dynamic>>>(onListen: () {
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
  // firestore
  //     .collection(collectionPath)
  //     .doc(docId)
  //     .snapshots(includeMetadataChanges: true);

  @override
  Future<void> updateDataOnDocument({
    required Map<String, dynamic> data,
    required String collectionPath,
    required String docId,
    required bool refresh,
  }) async {
    if (kDebugMode) {
      printWarning('[FIRESTORE] updateDataOnDocument on cloud');
    }
    await firestore.collection(collectionPath).doc(docId).update(data);
    if (refresh) {
      triggerUpdate();
    }
  }

  @override
  Stream<int> countDocuments(String collectionPath) {
    late StreamController<int> ctlr;

    StreamSubscription? triggerSubscription;
    Future<void> sendUpdate() async {
      if (kDebugMode) {
        printWarning('[FIRESTORE] countDocuments');
      }
      final items = await firestore.collection(collectionPath).count().get();
      if (!ctlr.isClosed) {
        ctlr.add(items.count);
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
  // firestore
  //     .collection(collectionPath)
  //     .count()
  //     .get()
  //     .asStream()
  //     .map((event) => event.count);

  @override
  Future<bool> exists({
    required String collectionPath,
    required String docId,
    required bool online,
  }) async {
    final document = await firestore.collection(collectionPath).doc(docId).get(
          GetOptions(
            source: online ? Source.serverAndCache : Source.cache,
          ),
        );
    return document.exists;
  }
}
