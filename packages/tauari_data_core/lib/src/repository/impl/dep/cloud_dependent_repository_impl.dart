import 'package:flutter/foundation.dart';

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
    super.cacheDataSource, {
    required super.onlineDataSource,
    required this.ownerIdColumn,
    required this.ownerRepository,
    required super.entityToModel,
  }) {
    ownerRepository.addOnCloudDeletionTrigger(
        (uid, docId) async => await deleteByOwnerCloud(
              uid,
              int.parse(docId),
              false,
            ));
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
  Future<Iterable<String>> deleteByOwnerCloud(
    String uid,
    int ownerId,
    bool refresh,
  ) async {
    final result = await cacheDataSource.deleteWhere(
      uid,
      QueryArgs(
          firestoreWhere:
              CloudDataWhere(field: ownerIdColumn, isEqualTo: ownerId)),
      refresh,
    );

    if (result.isEmpty) {
      return result;
    }
    for (var docId in result) {
      try {
        await onlineDataSource?.delete(uid, docId, false);

        // await onlineDataSource?.deleteWhere(
        //   uid,
        //   QueryArgs(
        //       firestoreWhere:
        //           CloudDataWhere(field: ownerIdColumn, isEqualTo: ownerId)),
        //   false,
        // );
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
    return result;
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
