// import 'package:ordered_set/ordered_set.dart';
// import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tauari_utils/tauari_utils.dart';
// import 'package:tauari_utils/tauari_utils.dart';
import 'package:tauari_values/tauari_values.dart';

import '../../entity/pool_set_of_entity.dart';
import '../../entity/set_of_entity.dart';
import '../../entity/syncable.dart';
import '../../entity/syncable_entity.dart';
import '../../model/syncable_model.dart';
import '../../query/query_args.dart';
import '../../utils/only_on_local.dart';
import '../syncable_repository.dart';

class SyncableRepositoryImpl<E extends SyncableEntity, M extends SyncableModel>
    extends SyncableRepository<E> {
  SyncableRepositoryImpl(
      {required super.localRepository, required super.cloudRepository});

  @override
  Future<E?> byId({
    String? uid,
    required int docId,
    required String? syncStatus,
  }) async {
    final localItem = await localRepository.byIdOnLocal(docId);
    if (onlyOnLocal(uid: uid, syncStatus: syncStatus)) {
      return localItem?.copyWithSyncStatus(SyncStatus.onlyLocal);
    }
    final cloudItem =
        await cloudRepository.byIdOnCloud(uid: uid!, docId: docId.toString());
    if (cloudItem == null) {
      return localItem?.copyWithSyncStatus(SyncStatus.onlyLocal);
    }
    if (localItem == null) {
      return cloudItem.copyWithSyncStatus(SyncStatus.onlyCloud);
    }
    return mergeCloudToLocal<E>(
        uid: uid, local: [localItem], cloud: [cloudItem]).first;
  }

  @override
  Stream<int> onCountEveryWhere(String? uid) {
    final localCount = localRepository.onLocalCount();
    final cloudCount =
        uid == null ? Stream.value(0) : cloudRepository.onCloudCount(uid);
    return Rx.combineLatest2(localCount, cloudCount, (a, b) => a + b);
  }

  // @override
  // Stream<Iterable<E>> onEveryWhere(String? uid, [QueryArgs? queryArgs]) async* {
  //   final Stream<Iterable<E>> localStream = localRepository.onLocal(queryArgs);
  //   // .map((list) => list.map((e) => e.toEntity()));
  //   // final hasNetwork = await availableNetwork();
  //   // if (uid == null || !hasNetwork) {
  //   //   yield* localStream;
  //   // }
  //   if (uid == null) {
  //     yield* localStream;
  //   }
  //   final Stream<Iterable<E>> cloudStream = cloudRepository.onCloud(uid!);
  //   // .map((list) => list.map((e) => e.toEntity()));

  //   final result = Rx.combineLatest2(
  //     localStream,
  //     cloudStream,
  //     (local, cloud) => mergeCloudToLocal(
  //       uid: uid,
  //       local: local,
  //       cloud: cloud,
  //     ),
  //   ).asBroadcastStream(
  //       onCancel: (subscription) => subscription.pause(),
  //       onListen: (subscription) => subscription.resume());
  //   yield* result;
  // }

  @override
  Stream<Iterable<E>> onEveryWhere(String? uid, [QueryArgs? queryArgs]) async* {
    final Stream<Iterable<E>> localStream = localRepository.onLocal(queryArgs);
    // .map((list) => list.map((e) => e.toEntity()));
    final hasNetwork = await availableNetwork();
    if (uid == null || !hasNetwork) {
      yield* localStream;
    }
    if (uid == null) {
      yield* localStream;
    }
    final Stream<Iterable<E>> cloudStream = cloudRepository.onCloud(uid!);
    // .map((list) => list.map((e) => e.toEntity()));

    final result = Rx.combineLatest2(
      localStream,
      cloudStream,
      (local, cloud) => mergeCloudToLocal(
        uid: uid,
        local: local,
        cloud: cloud,
      ),
    ).asBroadcastStream(
        onCancel: (subscription) => subscription.pause(),
        onListen: (subscription) => subscription.resume());
    yield* result;
  }

  @override
  Iterable<T> mergeCloudToLocal<T extends Syncable>({
    required String uid,
    required Iterable<T?> local,
    required Iterable<T?> cloud,
  }) {
    final localNonNull = local.whereType<T>();
    final cloudNonNull = cloud.whereType<T>();
    if (localNonNull.isEmpty && cloudNonNull.isEmpty) {
      return [];
    }
    final pool = PoolSetOfEntity<T>(
      SetOfEntity.fromList(localNonNull),
      SetOfEntity.fromList(cloudNonNull),
    );
    final items = pool.solveKeepLocal().items;
    // final ordered = OrderedSet<T>((a, b) => b.sortId.compareTo(a.sortId));
    // ordered.addAll(items);
    return items;
  }

  @override
  Future<bool> upload(String uid, E item) async {
    return await cloudRepository.insert(uid, item);
  }

  @override
  Future<Iterable<E>> dataEveryWhere(String? uid,
      [QueryArgs? queryArgs]) async {
    final local = await localRepository.dataLocal(queryArgs);
    if (uid == null) {
      return local;
    }
    final cloud = await cloudRepository.dataCloud(uid, queryArgs);

    return mergeCloudToLocal(uid: uid, local: local, cloud: cloud);
  }

  @override
  Stream<E?> onById({
    required String? uid,
    required int docId,
    required String? syncStatus,
  }) {
    final Stream<E?> localStream = localRepository
        .onByIdOnLocal(docId); //.map((event) => event?.toEntity());
    if (onlyOnLocal(
      uid: uid,
      syncStatus: SyncStatus.synced,
    )) {
      return localStream;
    }
    final Stream<E?> cloudStream =
        cloudRepository.onByIdOnCloud(uid: uid!, docId: docId.toString());
    // .map((event) => event?.toEntity());

    final result = Rx.combineLatest2(
      localStream,
      cloudStream,
      (local, cloud) {
        final list = mergeCloudToLocal<E>(
          uid: uid,
          local: [local],
          cloud: [cloud],
        );
        if (list.isEmpty) {
          return null;
        } else {
          return list.first;
        }
      },
    ).asBroadcastStream(
        onCancel: (subscription) => subscription.pause(),
        onListen: (subscription) => subscription.resume());
    return result;
  }

  @override
  Future<bool> sync(String? uid) async {
    final items = await dataEveryWhere(uid);
    final cloudItems =
        items.where((element) => element.getSyncStatus == SyncStatus.onlyCloud);
    if (cloudItems.isNotEmpty) {
      await localRepository.insertManyToLocal(
        cloudItems,
        refreshDb: false,
      );
    }
    final syncItems = items.where(
      (element) => element.getSyncStatus == SyncStatus.synced,
    );
    if (syncItems.isNotEmpty) {
      await localRepository.updateManyOnLocal(
        syncItems,
        refreshDb: false,
      );
    }

    // for (var item in filteredItems) {
    //   // if (item.modified == LocalLocked.unlocked) {
    //   await localRepository.insertToLocal(item);
    //   // }
    // }

    return Future.value(true);
  }

  @override
  Future<void> update(E item, String? uid) async {
    // final hasNetwork = await availableNetwork();

    // await localRepository.updateOnLocal(
    //   hasNetwork ? item : item.copyWithLocalLocked(LocalLocked.locked),
    // );
    final now = DateTime.now().millisecondsSinceEpoch;
    await localRepository.updateOnLocal(
      item.copyWithModified(
        now,
      ),
    );
    if (!onlyOnLocal(
      uid: uid,
      syncStatus: item.syncStatus,
    )) {
      await cloudRepository.updateOnCloud(
        item.copyWithModified(
          now,
        ),
        uid!,
      );
    }
    // else {
    // await localRepository.updateOnLocal(
    //   hasNetwork ? item : item.copyWithLocalLocked(LocalLocked.locked),
    // );

    // }
  }

  @override
  Future<void> deleteEveryWhere(String? uid, E item) async {
    if (!onlyOnLocal(
      uid: uid,
      syncStatus: item.syncStatus,
    )) {
      await cloudRepository.deleteFromCloud(uid: uid!, docId: item.docId);
    }
    await localRepository.deleteFromLocal(item.primaryKey);
  }

  @override
  Future<int> download(String uid, E item) async {
    return await localRepository.insertToLocal(item);
  }
}
