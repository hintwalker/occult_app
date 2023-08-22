import 'package:flutter/foundation.dart';

import '../../entity/cloud_getable.dart';
import '../../model/cloud_model.dart';
import '../cloud_repository.dart';
import 'read_only_cloud_repository_impl.dart';

abstract class CloudRepositoryImpl<E extends CloudGetable,
        M extends CloudModel<E>> extends ReadOnlyCloudRepositoryImpl<E, M>
    implements CloudRepository<E> {
  CloudRepositoryImpl(
    super.cacheDataSource, {
    required super.entityToModel,
    required super.onlineDataSource,
  });

  final List<Future<void> Function(String uid, String docId)>
      onCloudDeletionTriggers = [];
  @override
  void addOnCloudDeletionTrigger(
      Future<void> Function(String uid, String docId) trigger) {
    onCloudDeletionTriggers.add(trigger);
  }

  @override
  Future<bool> deleteFromCloud({
    required String uid,
    required String docId,
    required bool refresh,
  }) async {
    final result = await cacheDataSource.delete(uid, docId, refresh);
    try {
      await onlineDataSource?.delete(uid, docId, false);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    if (result) {
      for (var trigger in onCloudDeletionTriggers) {
        await trigger(uid, docId);
      }
    }

    return result;
  }

  // @override
  // Future<E?> byIdOnCloud({required String uid, required String docId}) async {
  //   final model = await dataSource.byId(uid, docId);
  //   return model?.toEntity();
  // }

  @override
  Future<void> updateOnCloud(
    E item,
    String uid,
    bool refresh,
  ) async {
    await cacheDataSource.update(
      uid,
      entityToModel(item),
      refresh,
    );
    try {
      await onlineDataSource?.update(uid, entityToModel(item), false);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Future<bool> insert(
    String uid,
    E item,
    bool refresh,
  ) async {
    final result = await cacheDataSource.insert(
      uid,
      entityToModel(item),
      refresh,
    );
    try {
      await onlineDataSource?.insert(uid, entityToModel(item), false);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return result;
  }

  @override
  Future<void> insertMany(String uid, Iterable<E> items, bool refresh) async {
    for (var item in items) {
      await insert(uid, item, false);
    }
    if (refresh) {
      this.refresh();
    }
  }

  @override
  Future<void> pullOnlineData(String uid, bool refresh) async {
    final data = await fetchOnlineData(uid);
    for (var item in data) {
      await cacheDataSource.insert(
        uid,
        entityToModel(item),
        false,
      );
    }
    if (refresh) {
      this.refresh();
    }
  }

  @override
  void refresh() => cacheDataSource.refresh();
}
