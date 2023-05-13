part of lasotuvi_data;

class NoteRepositoryImpl
    extends SyncableDependentRepositoryImpl<Note, NoteModel, Chart>
    implements NoteRepository {
  NoteRepositoryImpl({
    required super.localDependentRepository,
    required super.cloudDependentRepository,
    required super.ownerRepository,
  });
  // : super(
  //           entityToModel: (entity) => NoteModel.fromEntity(entity),
  //           ownerIdColumn: ColumnNote.chartId,
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
  //     required int noteId,
  //     required Iterable<Chart> charts}) async {
  //   final now = DateTime.now().millisecondsSinceEpoch;
  //   final List<ChartNoteModel> models = [];
  //   var i = 0;
  //   for (var chart in charts) {
  //     final id = now + i;
  //     final model = ChartNoteModel(id: id, chartId: chart.id, noteId: noteId);
  //     models.add(model);
  //     i++;
  //   }
  //   final count =
  //       await (localDataSource as SqliteNoteDataSource).insertCharts(models);
  //   if (uid != null) {
  //     await (remoteDataSource as FirebaseNoteDataSource)
  //         .insertCharts(uid, models);
  //   }
  //   return count;
  // }

  // @override
  // Future<int> removeCharts(
  //     {String? uid,
  //     required Iterable<int> ids}) async {
  //   final count = await (localDataSource as SqliteNoteDataSource)
  //       .removeCharts(ids);
  //   if (uid != null) {
  //     await (remoteDataSource as FirebaseNoteDataSource)
  //         .removeCharts(uid, ids);
  //   }
  //   return count;
  // }
}
