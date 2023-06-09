part of lasotuvi_data;

class CloudNoteRepositoryImpl
    extends CloudDependentRepositoryImpl<Note, NoteModel, Chart>
    implements CloudNoteRepository {
  CloudNoteRepositoryImpl(super.dataSource,
      {required super.ownerIdColumn,
      required super.ownerRepository,
      required super.entityToModel});

  @override
  int getOwnerId(Note entity) => entity.chartId;
}
