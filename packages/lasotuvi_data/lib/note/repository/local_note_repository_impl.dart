part of lasotuvi_data;

class LocalNoteRepositoryImpl
    extends LocalDependentRepositoryImpl<Note, NoteModel, Chart>
    implements LocalNoteRepository {
  LocalNoteRepositoryImpl(super.dataSource,
      {required super.ownerIdColumn,
      required super.ownerRepository,
      required super.entityToModel});

  @override
  int getOwnerId(Note entity) => entity.chartId;
}
