part of lasotuvi_provider;

final noteRepositoryProvider = Provider.autoDispose<NoteRepository>(
  (ref) => NoteRepositoryImpl(
      localDependentRepository: ref.read(localNoteRepositoryProvider),
      cloudDependentRepository: ref.read(cloudNoteRepositoryProvider),
      ownerRepository: ref.read(chartRepositoryProvider)),
);
