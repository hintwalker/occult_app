import '../../entity/cloud_getable.dart';
import '../../model/cloud_model.dart';
import '../../query/query_args.dart';
import '../../source/remote_data_source.dart';
import '../read_only_cloud_repository.dart';

abstract class ReadOnlyCloudRepositoryImpl<E extends CloudGetable,
    M extends CloudModel<E>> implements ReadOnlyCloudRepository<E> {
  final RemoteDataSource<M> dataSource;
  final M Function(E) entityToModel;

  ReadOnlyCloudRepositoryImpl(this.dataSource, {required this.entityToModel});

  @override
  Future<E?> byIdOnCloud({required String uid, required String docId}) async {
    final model = await dataSource.byId(uid, docId);
    return model?.toEntity();
  }

  @override
  Stream<Iterable<E>> onCloud(String uid, [QueryArgs? queryArgs]) {
    return dataSource
        .onData(uid, queryArgs)
        .map((list) => list.map((e) => e.toEntity()));
  }

  @override
  Stream<int> onCloudCount(String uid) {
    return dataSource.onCount(uid);
  }

  @override
  Future<Iterable<E>> dataCloud(String uid, [QueryArgs? queryArgs]) async {
    final result = await dataSource.data(uid, queryArgs);
    return result.map((e) => e.toEntity());
  }

  @override
  Stream<E?> onByIdOnCloud({required String uid, required String docId}) {
    return dataSource.onById(uid, docId).map((event) => event?.toEntity());
  }
}
