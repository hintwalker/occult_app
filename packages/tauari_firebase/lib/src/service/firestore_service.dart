import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_utils/tauari_utils.dart';

class FirestoreService implements CloudService {
  const FirestoreService(this.firestore);

  final FirebaseFirestore firestore;

  /// Collection Operations

  @override
  Future<DocumentReference<Map<String, dynamic>>> addToCollection(
          {required Map<String, dynamic> data,
          required String collectionPath}) =>
      firestore.collection(collectionPath).add(data);

  Future<void> createEmptyCollection({required String collectionPath}) async {
    final collection = firestore.collection(collectionPath);
    collection.doc().set({});
  }

  @override
  Future<void> setToCollection(
      {required String key,
      required Map<String, dynamic> data,
      required String collectionPath}) async {
    firestore.collection(collectionPath).doc(key).set(data);
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

    if (orderBy != null) {
      if (result == null) {
        result =
            collection.orderBy(orderBy.field, descending: orderBy.descending);
      } else {
        result = result.orderBy(orderBy.field, descending: orderBy.descending);
      }
    }
    if (limit != null) {
      if (result == null) {
        result = collection.limit(limit);
      } else {
        result = result.limit(limit);
      }
    }
    return result!;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getFromCollection(
      {required String collectionPath,
      CloudDataOrderBy? orderBy,
      int? limit,
      CloudDataWhere? where}) async {
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
    var collection = firestore.collection(collectionPath);

    if (orderBy == null && limit == null && where == null) {
      return collection.snapshots(includeMetadataChanges: true);
    }
    final result = _buildQuery(
      collection: collection,
      orderBy: orderBy,
      limit: limit,
      where: where,
    );

    return result.snapshots(includeMetadataChanges: true);
    // return firestore
    //     .collection(collectionPath)
    //     .orderBy(orderField, descending: descending)
    //     .limit(limit)
    //     .snapshots();
  }

  /// Document Operations

  @override
  Future<bool> deleteDocumentFromCollection({
    required String collectionPath,
    required String docId,
    required bool online,
  }) async {
    final doc = firestore.collection(collectionPath).doc(docId);
    final data = await doc.get(
      GetOptions(
        source: online ? Source.serverAndCache : Source.cache,
      ),
    );
    if (data.exists) {
      await firestore.collection(collectionPath).doc(docId).delete();
      return true;
    }
    return false;
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getFromDocument({
    required String collectionPath,
    required String docId,
    required bool online,
  }) async {
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
  }) async {
    final docRef = firestore.collection(collectionPath).doc(doc);

    await docRef.set(
      data,
    );
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getSnapshotStreamFromDocument(
          {required String collectionPath, required String docId}) =>
      firestore
          .collection(collectionPath)
          .doc(docId)
          .snapshots(includeMetadataChanges: true);

  @override
  Future<void> updateDataOnDocument(
          {required Map<String, dynamic> data,
          required String collectionPath,
          required String docId}) =>
      firestore.collection(collectionPath).doc(docId).update(data);

  @override
  Stream<int> countDocuments(String collectionPath) => firestore
      .collection(collectionPath)
      .count()
      .get()
      .asStream()
      .map((event) => event.count);

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
