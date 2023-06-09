part of lasotuvi_provider;

final localNoteRepositoryProvider =
    Provider.autoDispose<LocalNoteRepositoryImpl>(
  (ref) => LocalNoteRepositoryImpl(ref.read(sqliteNoteDataSourceProvider),
      ownerIdColumn: ColumnNote.chartId,
      ownerRepository: ref.read(localChartRepositoryProvider),
      entityToModel: (note) => NoteModel.fromEntity(note)),
);
