part of lasotuvi_provider;

final authDataSourceProvider = Provider<FirebaseAuthDataSource>(
  (ref) => FirebaseAuthDataSource(
    ref.read(authServiceProvider),
  ),
);
