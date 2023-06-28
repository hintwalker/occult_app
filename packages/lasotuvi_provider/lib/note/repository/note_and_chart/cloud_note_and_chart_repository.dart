part of lasotuvi_provider;

final cloudNoteAndChartRepositoryProvider =
    Provider.autoDispose<CloudNoteAndChartRepository>(
  (ref) => CloudNoteAndChartRepositoryImpl(
      ref.read(firebaseNoteDataSourceProvider),
      ownerRepository: ref.read(cloudChartRepositoryProvider)),
);
