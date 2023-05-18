part of tauari_data_core;

class SyncableRepositoryImpl<E extends SyncableEntity, M extends SyncableModel>
    extends SyncableRepository<E> {
  SyncableRepositoryImpl(
      {required super.localRepository, required super.cloudRepository});

  @override
  Future<E?> byId({String? uid, required int docId}) async {
    final localItem = await localRepository.byIdOnLocal(docId);
    if (uid == null) {
      return localItem?.copyWithOnCloud(OnCloudValues.onlyLocal);
    }
    final cloudItem =
        await cloudRepository.byIdOnCloud(uid: uid, docId: docId.toString());
    if (cloudItem == null) {
      return localItem?.copyWithOnCloud(OnCloudValues.onlyLocal);
    }
    if (localItem == null) {
      return cloudItem.copyWithOnCloud(OnCloudValues.onlyCloud);
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

  @override
  Stream<Iterable<E>> onEveryWhere(String? uid, [QueryArgs? queryArgs]) {
    final Stream<Iterable<E>> localStream = localRepository.onLocal(queryArgs);
    // .map((list) => list.map((e) => e.toEntity()));
    if (uid == null) {
      return localStream;
    }
    final Stream<Iterable<E>> cloudStream = cloudRepository.onCloud(uid);
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
    return result;
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
    final items = pool.solve().items;
    final ordered = OrderedSet<T>((a, b) => b.sortId.compareTo(a.sortId));
    ordered.addAll(items);
    return ordered;
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
  Stream<E?> onById({String? uid, required int docId}) {
    final Stream<E?> localStream = localRepository
        .onByIdOnLocal(docId); //.map((event) => event?.toEntity());
    if (uid == null) {
      return localStream;
    }
    final Stream<E?> cloudStream =
        cloudRepository.onByIdOnCloud(uid: uid, docId: docId.toString());
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
    final filteredItems =
        items.where((element) => element.onCloud == OnCloudValues.onlyCloud);
    for (var item in filteredItems) {
      localRepository.insertToLocal(item);
    }
    return Future.value(true);
  }

  @override
  Future<void> update(E item, String? uid) async {
    await localRepository.updateOnLocal(item);
    if (uid != null) {
      await cloudRepository.updateOnCloud(item, uid);
    }
  }

  @override
  Future<void> deleteEveryWhere(String? uid, E item) async {
    if (uid != null) {
      await cloudRepository.deleteFromCloud(uid: uid, docId: item.docId);
    }
    await localRepository.deleteFromLocal(item.primaryKey);
  }

  @override
  Future<int> download(String uid, E item) async {
    return await localRepository.insertToLocal(item);
  }
}
