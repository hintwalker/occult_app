import '../../../entity/cloud_getable.dart';
import '../../../model/cloud_model.dart';
import '../../../query/cloud_data_where.dart';
import '../../../query/query_args.dart';
import '../../cloud_repository.dart';
import '../../dep/cloud_dependent_repository.dart';
import '../cloud_repository_impl.dart';

abstract class CloudDependentRepositoryImpl<
        E extends CloudGetable,
        M extends CloudModel<E>,
        O extends CloudGetable> extends CloudRepositoryImpl<E, M>
    implements CloudDependentRepository<E, O> {
  CloudDependentRepositoryImpl(
    super.dataSource, {
    required this.ownerIdColumn,
    required this.ownerRepository,
    required super.entityToModel,
  }) {
    ownerRepository.addOnCloudDeletionTrigger(
        (uid, docId) async => await deleteByOwnerCloud(uid, int.parse(docId)));
  }

  final String ownerIdColumn;
  final CloudRepository<O> ownerRepository;

  @override
  Future<Iterable<E>> byOwnerIdCloud(String uid, int ownerId) async {
    return await dataCloud(
        uid,
        QueryArgs(
            firestoreWhere:
                CloudDataWhere(field: ownerIdColumn, isEqualTo: ownerId)));
  }

  @override
  Future<int> deleteByOwnerCloud(String uid, int ownerId) async {
    return await dataSource.deleteWhere(
        uid,
        QueryArgs(
            firestoreWhere:
                CloudDataWhere(field: ownerIdColumn, isEqualTo: ownerId)));
  }

  @override
  Stream<Iterable<E>> onByOwnerIdCloud(String uid, int ownerId) {
    return onCloud(
        uid,
        QueryArgs(
            firestoreWhere:
                CloudDataWhere(field: ownerIdColumn, isEqualTo: ownerId)));
  }

  @override
  Future<O?> ownerCloud(String uid, int ownerId) async {
    // final dependentItem =
    //     await byIdOnCloud(uid: uid, docId: dependentId.toString());
    // if (dependentItem == null) {
    //   return null;
    // }
    // final ownerId = getOwnerId(dependentItem);
    return await ownerRepository.byIdOnCloud(
        uid: uid, docId: ownerId.toString());
  }
}
