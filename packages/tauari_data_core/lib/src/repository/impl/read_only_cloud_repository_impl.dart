import '../../entity/cloud_getable.dart';
import '../../model/cloud_model.dart';
import '../../query/query_args.dart';
import '../../source/cloud_data_source.dart';
import '../read_only_cloud_repository.dart';

abstract class ReadOnlyCloudRepositoryImpl<E extends CloudGetable,
    M extends CloudModel<E>> implements ReadOnlyCloudRepository<E> {
  final CloudDataSource<M> cacheDataSource;
  final CloudDataSource<M>? onlineDataSource;
  final M Function(E) entityToModel;

  ReadOnlyCloudRepositoryImpl(
    this.cacheDataSource, {
    required this.entityToModel,
    required this.onlineDataSource,
  });

  @override
  Future<E?> byIdOnCloud({required String uid, required String docId}) async {
    final model = await cacheDataSource.byId(uid, docId);
    return model?.toEntity();
  }

  @override
  Stream<Iterable<E>> onCloud(String uid, [QueryArgs? queryArgs]) {
    return cacheDataSource
        .onData(uid, queryArgs)
        .map((list) => list.map((e) => e.toEntity()));
  }

  @override
  Stream<int> onCloudCount(String uid) {
    return cacheDataSource.onCount(uid);
  }

  @override
  Future<Iterable<E>> dataCloud(String uid, [QueryArgs? queryArgs]) async {
    final result = await cacheDataSource.data(uid, queryArgs);
    return result.map((e) => e.toEntity());
  }

  @override
  Stream<E?> onByIdOnCloud({required String uid, required String docId}) {
    return cacheDataSource.onById(uid, docId).map((event) => event?.toEntity());
  }

  @override
  Future<Iterable<E>> fetchOnlineData(String uid) async {
    final result = await onlineDataSource?.data(uid);

    return result == null ? [] : result.map((e) => e.toEntity());
  }

  @override
  void refresh() => cacheDataSource.refresh();
}
