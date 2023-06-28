part of lasotuvi_data;

class LocalNoteAndChartRepositoryImpl
    extends LocalDependentRepositoryImpl<Note, NoteModel, Chart>
    implements LocalNoteAndChartRepository {
  LocalNoteAndChartRepositoryImpl(
    super.dataSource, {
    required super.ownerRepository,
  }) : super(
          ownerIdColumn: ColumnNote.chartId,
          entityToModel: (entity) => NoteModel.fromEntity(entity),
        );

  @override
  int getOwnerId(Note entity) => entity.chartId;
}
