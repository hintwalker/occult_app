import '../../entity/cloud_getable.dart';
import '../../query/query_args.dart';
import '../../repository/cloud_repository.dart';

class DataOnCloud<E extends CloudGetable, R extends CloudRepository<E>> {
  const DataOnCloud(this.repository);
  final R repository;
  Future<Iterable<E>> call(String uid, [QueryArgs? queryArgs]) =>
      repository.dataCloud(uid, queryArgs);
}
