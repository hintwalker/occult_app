part of lasotuvi_provider;

final userRepositoryProvider = Provider.autoDispose<UserRepository>(
    (ref) => UserRepositoryImpl(ref.read(userDataSourceProvider)));
