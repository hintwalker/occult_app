part of lasotuvi_provider;

final currentUserProvider = Provider<UserEntity?>(
    (ref) => ref.read(authRepositoryProvider).currentUser());
