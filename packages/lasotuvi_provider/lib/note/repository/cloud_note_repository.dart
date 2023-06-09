part of lasotuvi_provider;

final cloudNoteRepositoryProvider =
    Provider.autoDispose<CloudNoteRepositoryImpl>(
  (ref) => CloudNoteRepositoryImpl(ref.read(firebaseNoteDataSourceProvider),
      ownerIdColumn: ColumnNote.chartId,
      ownerRepository: ref.read(cloudChartRepositoryProvider),
      entityToModel: (note) => NoteModel.fromEntity(note)),
);
