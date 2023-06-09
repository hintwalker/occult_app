part of lasotuvi_provider;

final localTagRepositoryProvider = Provider.autoDispose<LocalTagRepository>(
    (ref) => LocalTagRepositoryImpl(ref.read(sqliteTagDataSourceProvider)));
