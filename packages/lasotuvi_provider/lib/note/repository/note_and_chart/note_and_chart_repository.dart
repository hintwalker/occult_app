part of lasotuvi_provider;

final noteAndChartRepositoryProvider =
    Provider.autoDispose<NoteAndChartRepository>(
  (ref) => NoteAndChartRepositoryImpl(
      localDependentRepository: ref.read(localNoteAndChartRepositoryProvider),
      cloudDependentRepository: ref.read(cloudNoteAndChartRepositoryProvider),
      ownerRepository: ref.read(chartRepositoryProvider)),
);
