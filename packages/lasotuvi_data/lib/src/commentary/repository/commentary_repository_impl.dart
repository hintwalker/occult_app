import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/commentary_model.dart';

class CommentaryRepositoryImpl
    extends SyncableDependentRepositoryImpl<Commentary, CommentaryModel, Chart>
    implements CommentaryRepository {
  CommentaryRepositoryImpl({
    required super.localDependentRepository,
    required super.cloudDependentRepository,
    required super.ownerRepository,
  });
  // : super(
  //           entityToModel: (entity) => CommentaryModel.fromEntity(entity),
  //           ownerIdColumn: ColumnCommentary.chartId,
  //           getOwnerId: (entity) => entity.chartId);

  // @override
  // Future<void> updateContent(String content, {required int id, String? uid}) {
  //   localDataSource.update(item)
  // }

  // @override
  // Future<void> updateTitle(String title, {required int id, String? uid}) {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<int> insertCharts(
  //     {String? uid,
  //     required int commentaryId,
  //     required Iterable<Chart> charts}) async {
  //   final now = DateTime.now().millisecondsSinceEpoch;
  //   final List<ChartCommentaryModel> models = [];
  //   var i = 0;
  //   for (var chart in charts) {
  //     final id = now + i;
  //     final model = ChartCommentaryModel(id: id, chartId: chart.id, commentaryId: commentaryId);
  //     models.add(model);
  //     i++;
  //   }
  //   final count =
  //       await (localDataSource as SqliteCommentaryDataSource).insertCharts(models);
  //   if (uid != null) {
  //     await (remoteDataSource as FirebaseCommentaryDataSource)
  //         .insertCharts(uid, models);
  //   }
  //   return count;
  // }

  // @override
  // Future<int> removeCharts(
  //     {String? uid,
  //     required Iterable<int> ids}) async {
  //   final count = await (localDataSource as SqliteCommentaryDataSource)
  //       .removeCharts(ids);
  //   if (uid != null) {
  //     await (remoteDataSource as FirebaseCommentaryDataSource)
  //         .removeCharts(uid, ids);
  //   }
  //   return count;
  // }
}
