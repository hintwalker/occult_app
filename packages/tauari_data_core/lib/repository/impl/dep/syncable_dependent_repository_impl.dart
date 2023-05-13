part of tauari_data_core;

abstract class SyncableDependentRepositoryImpl<
        E extends SyncableEntity,
        M extends SyncableModel<M, E>,
        O extends SyncableEntity> extends SyncableRepositoryImpl<E, M>
    implements SyncableDependentRepository<E, O> {
  SyncableDependentRepositoryImpl({
    required this.localDependentRepository,
    required this.cloudDependentRepository,
    required this.ownerRepository,
  }) : super(
            localRepository: localDependentRepository,
            cloudRepository: cloudDependentRepository);

  final SyncableRepository<O> ownerRepository;
  final LocalDependentRepository<E, O> localDependentRepository;
  final CloudDependentRepository<E, O> cloudDependentRepository;

  @override
  Future<Iterable<E>> byOwnerId(String? uid, int ownerId) async {
    final local = await localDependentRepository.byOwnerIdLocal(ownerId);
    if (uid == null) {
      return local;
    }
    final cloud = await cloudDependentRepository.byOwnerIdCloud(uid, ownerId);
    return mergeCloudToLocal(uid: uid, local: local, cloud: cloud);
  }

  @override
  Future<int> deleteByOwner(String? uid, int ownerId) async {
    final rows = await localDependentRepository.deleteByOwnerLocal(ownerId);
    if (uid != null) {
      await cloudDependentRepository.deleteByOwnerCloud(uid, ownerId);
    }
    return rows;
  }

  @override
  Stream<Iterable<E>> onByOwnerId(String? uid, int ownerId) {
    final local = localDependentRepository.onByOwnerIdLocal(ownerId);
    if (uid == null) {
      return local;
    }
    final cloud = cloudDependentRepository.onByOwnerIdCloud(uid, ownerId);
    final result = Rx.combineLatest2(
      local,
      cloud,
      (a, b) => mergeCloudToLocal(uid: uid, local: a, cloud: b),
    ).asBroadcastStream(
        onCancel: (subscription) => subscription.pause(),
        onListen: (subscription) => subscription.resume());
    return result;
  }

  @override
  Future<O?> owner(String? uid, int dependentId) async {
    final local = await localDependentRepository.ownerLocal(dependentId);
    if (uid == null) {
      return local;
    }
    final cloud = await cloudDependentRepository.ownerCloud(uid, dependentId);
    if (cloud == null) {
      return local;
    }
    if (local == null) {
      return cloud;
    }
    return mergeCloudToLocal<O>(uid: uid, local: [local], cloud: [cloud]).first;
  }

  @override
  Stream<Iterable<SyncableEntityCarrier<O, E>>> onOwnerHasThese(String? uid,
      SyncableEntityCarrier<O, E> Function(O p1, Iterable<E> p2) onCreateItem) {
    return ownerRepository
        .onEveryWhere(uid)
        .asyncMap((event) async => await Future.wait(event.map(
              (owner) async {
                final these = await byOwnerId(uid, owner.id);
                return onCreateItem(owner, these);
              },
            )));
  }

  @override
  Stream<Iterable<SyncableEntityCarrier<O, E>>> onOwnerAndThis(String? uid,
      SyncableEntityCarrier<O, E> Function(O p1, E p2) onCreateItem) {
    return onEveryWhere(uid)
        .asyncMap((event) async => await Future.wait(event.map((e) async {
              final own = await owner(uid, e.id);
              // if (own == null) {
              //   return null;
              // }
              return onCreateItem(own!, e);
            })));
  }
}
