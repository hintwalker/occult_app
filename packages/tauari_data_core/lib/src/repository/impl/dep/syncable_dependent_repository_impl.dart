import 'package:rxdart/rxdart.dart';

import '../../../entity/syncable_entity.dart';
import '../../../entity/syncable_entity_carrier.dart';
import '../../../entity/syncable_entity_pair.dart';
import '../../../model/syncable_model.dart';
import '../../../query/query_args.dart';
import '../../../utils/only_on_local.dart';
import '../../dep/cloud_dependent_repository.dart';
import '../../dep/local_dependent_repository.dart';
import '../../dep/syncable_dependent_repository.dart';
import '../../syncable_repository.dart';
import '../syncable_repository_impl.dart';

abstract class SyncableDependentRepositoryImpl<
        E extends SyncableEntity,
        M extends SyncableModel<E>,
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
  Future<Iterable<E>> byOwnerId(
    String? uid,
    int ownerId,
    String? syncStatus,
  ) async {
    final local = await localDependentRepository.byOwnerIdLocal(ownerId);
    if (onlyOnLocal(uid: uid, syncStatus: syncStatus)) {
      return local;
    }
    final cloud = await cloudDependentRepository.byOwnerIdCloud(uid!, ownerId);
    return mergeCloudToLocal(uid: uid, local: local, cloud: cloud);
  }

  @override
  Future<int> deleteByOwner(
    String? uid,
    int ownerId,
    String? syncStatus,
  ) async {
    final rows = await localDependentRepository.deleteByOwnerLocal(ownerId);
    if (!onlyOnLocal(uid: uid, syncStatus: syncStatus)) {
      await cloudDependentRepository.deleteByOwnerCloud(uid!, ownerId);
    }
    return rows;
  }

  @override
  Stream<Iterable<E>> onByOwnerId(
    String? uid,
    int ownerId,
    String? syncStatus,
  ) {
    final local = localDependentRepository.onByOwnerIdLocal(ownerId);
    if (onlyOnLocal(uid: uid, syncStatus: syncStatus)) {
      return local;
    }
    final cloud = cloudDependentRepository.onByOwnerIdCloud(uid!, ownerId);
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
  Future<O?> ownerOf(String? uid, int dependentId) async {
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
  Stream<Iterable<SyncableEntityCarrier<O, E>>> onOwnerHasThese({
    String? uid,
    QueryArgs? queryArgs,
    required SyncableEntityCarrier<O, E> Function(O p1, Iterable<E> p2)
        onCreateItem,
  }) {
    return ownerRepository
        .onEveryWhere(uid, queryArgs)
        .asyncMap((event) async => await Future.wait(event.map(
              (owner) async {
                final these = await byOwnerId(uid, owner.id, owner.syncStatus);
                return onCreateItem(owner, these);
              },
            )));
  }

  @override
  Stream<Iterable<SyncableEntityPair<E, O>>> onOwnerAndThis(
      {String? uid,
      QueryArgs? queryArgs,
      required SyncableEntityPair<E, O> Function(E p1, O p2) onCreateItem}) {
    return onEveryWhere(uid, queryArgs)
        .asyncMap((event) async => await Future.wait(event.map((e) async {
              final owner = await ownerOf(uid, e.id);
              // if (own == null) {
              //   return null;
              // }
              return onCreateItem(e, owner!);
            })));
  }
}
