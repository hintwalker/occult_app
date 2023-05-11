part of lasotuvi_provider;

final authStateChangesProvider = StreamProvider.autoDispose(
    (ref) => ref.read(authRepositoryProvider).authStateChanges());
