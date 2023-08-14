import '../query/cloud_data_order_by.dart';
import '../query/cloud_data_where.dart';

abstract class CloudService {
  Future<bool> exists({
    required String collectionPath,
    required String docId,
    required bool online,
  });
  Future<dynamic> addToCollection(
      {required Map<String, dynamic> data, required String collectionPath});
  Future<void> setToCollection(
      {required String key,
      required Map<String, dynamic> data,
      required String collectionPath});
  Future<dynamic> getFromCollection(
      {required String collectionPath,
      CloudDataOrderBy? orderBy,
      int? limit,
      CloudDataWhere? where});
  Stream<dynamic> getSnapshotStreamFromCollection(
      {required String collectionPath,
      CloudDataOrderBy? orderBy,
      int? limit,
      CloudDataWhere? where});
  Future<bool> deleteDocumentFromCollection({
    required String collectionPath,
    required String docId,
    required bool online,
  });
  Future<dynamic> getFromDocument({
    required String collectionPath,
    required String docId,
    required bool online,
  });
  Future<void> setDataOnDocument(
      {required Map<String, dynamic> data,
      required String collectionPath,
      required String doc});
  Stream<dynamic> getSnapshotStreamFromDocument(
      {required String collectionPath, required String docId});
  Future<void> updateDataOnDocument(
      {required Map<String, dynamic> data,
      required String collectionPath,
      required String docId});
  Stream<int> countDocuments(String collectionPath);
}
