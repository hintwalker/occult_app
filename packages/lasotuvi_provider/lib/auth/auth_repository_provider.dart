part of lasotuvi_provider;

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(
    ref.read(authDataSourceProvider),
  ),
);
