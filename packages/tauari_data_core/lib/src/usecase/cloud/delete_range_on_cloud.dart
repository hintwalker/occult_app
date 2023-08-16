import '../../constant/column_names.dart';
import '../../entity/cloud_getable.dart';
import '../../query/cloud_data_order_by.dart';
import '../../query/query_args.dart';
import '../../repository/cloud_repository.dart';

class DeleteRangeOnCloud<E extends CloudGetable, R extends CloudRepository> {
  final R repository;

  const DeleteRangeOnCloud(this.repository);

  Future<bool> call(String uid, int skipAtStart) async {
    final data = await repository.dataCloud(
      uid,
      QueryArgs(
        uid: uid,
        firestoreOrderBy: const CloudDataOrderBy(field: columnUploadDate),
      ),
    );
    final len = data.length;
    if (len <= skipAtStart) {
      return false;
    }
    for (var i = skipAtStart; i < len; i++) {
      await repository.deleteFromCloud(
        uid: uid,
        docId: data.elementAt(i).docId,
      );
    }
    return true;
  }
}
