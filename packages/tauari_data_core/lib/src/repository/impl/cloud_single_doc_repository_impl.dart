import 'package:flutter/foundation.dart';

import '../../entity/cloud_getable.dart';
import '../../model/cloud_model.dart';
import '../../source/cloud_single_doc_data_source.dart';
import '../cloud_single_doc_repository.dart';

class CloudSingleDocRepositoryImpl<E extends CloudGetable, M extends CloudModel>
    implements CloudSingleDocRepository<E> {
  final CloudSingleDocDataSource cacheDataSource;
  final CloudSingleDocDataSource onlineDataSource;
  final M Function(E) entityToModel;

  const CloudSingleDocRepositoryImpl(
    this.cacheDataSource, {
    required this.onlineDataSource,
    required this.entityToModel,
  });
  @override
  Future<bool> delete(String uid, bool refresh) async {
    final result = await cacheDataSource.delete(uid, refresh);
    try {
      await onlineDataSource.delete(uid, refresh);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return result;
  }

  @override
  Future<E?> doc(String uid) async =>
      await cacheDataSource.doc(uid).then((value) => value?.toEntity());

  @override
  Stream<E?> onDoc(String uid) =>
      cacheDataSource.onDoc(uid).map((event) => event?.toEntity());

  @override
  Future<bool> update(String uid, E doc, bool refresh) async {
    final result =
        await cacheDataSource.update(uid, entityToModel(doc), refresh);
    try {
      await onlineDataSource.update(uid, entityToModel(doc), refresh);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return result;
  }

  @override
  Future<void> pullOnlineDoc(String uid, bool refresh) async {
    final doc = await onlineDataSource.doc(uid);
    if (doc != null) {
      await cacheDataSource.update(uid, doc, refresh);
    }
  }
}
