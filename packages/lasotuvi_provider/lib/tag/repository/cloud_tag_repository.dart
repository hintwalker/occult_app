part of lasotuvi_provider;

final cloudTagRepositoryProvider = Provider.autoDispose<CloudTagRepository>(
    (ref) => CloudTagRepositoryImpl(ref.read(firebaseTagDataSourceProvider)));
