part of lasotuvi_data;

class CloudNoteAndChartRepositoryImpl
    extends CloudDependentRepositoryImpl<Note, NoteModel, Chart>
    implements CloudNoteAndChartRepository {
  CloudNoteAndChartRepositoryImpl(
    super.dataSource, {
    required super.ownerRepository,
  }) : super(
          ownerIdColumn: ColumnNote.chartId,
          entityToModel: (entity) => NoteModel.fromEntity(entity),
        );

  @override
  int getOwnerId(Note entity) => entity.chartId;
}
