part of lasotuvi_provider;

final currentSubRepositoryProvider = Provider.autoDispose<CurrentSubRepository>(
    (ref) => CurrentSubRepositoryImpl(ref.read(currentSubDataSourceProvider)));
