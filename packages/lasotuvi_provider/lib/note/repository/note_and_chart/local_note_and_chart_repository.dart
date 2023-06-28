part of lasotuvi_provider;

final localNoteAndChartRepositoryProvider =
    Provider.autoDispose<LocalNoteAndChartRepository>(
  (ref) => LocalNoteAndChartRepositoryImpl(
      ref.read(sqliteNoteDataSourceProvider),
      ownerRepository: ref.read(localChartRepositoryProvider)),
);
