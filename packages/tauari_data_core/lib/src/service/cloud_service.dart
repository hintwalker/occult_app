import '../query/cloud_data_order_by.dart';
import '../query/cloud_data_where.dart';

abstract class CloudService {
  void triggerUpdate();
  Future<bool> exists({
    required String collectionPath,
    required String docId,
    required bool online,
  });
  // Future<dynamic> addToCollection({
  //   required Map<String, dynamic> data,
  //   required String collectionPath,
  //   required bool refresh,
  // });
  Future<void> setToCollection({
    required String key,
    required Map<String, dynamic> data,
    required String collectionPath,
    required bool refresh,
  });
  Future<dynamic> getFromCollection({
    required String collectionPath,
    CloudDataOrderBy? orderBy,
    int? limit,
    CloudDataWhere? where,
  });
  Stream<dynamic> getSnapshotStreamFromCollection({
    required String collectionPath,
    CloudDataOrderBy? orderBy,
    int? limit,
    CloudDataWhere? where,
  });
  Future<bool> deleteDocumentFromCollection({
    required String collectionPath,
    required String docId,
    required bool online,
    required bool refresh,
  });
  Future<dynamic> getFromDocument({
    required String collectionPath,
    required String docId,
    required bool online,
  });
  Future<void> setDataOnDocument({
    required Map<String, dynamic> data,
    required String collectionPath,
    required String doc,
    required bool refresh,
  });
  Stream<dynamic> getSnapshotStreamFromDocument({
    required String collectionPath,
    required String docId,
    required bool online,
  });
  Future<void> updateDataOnDocument({
    required Map<String, dynamic> data,
    required String collectionPath,
    required String docId,
    required bool refresh,
  });
  Stream<int> countDocuments(String collectionPath);
}
