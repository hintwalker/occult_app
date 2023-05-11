part of lasotuvi_provider;

final signOutProvider = Provider<SignOut>((ref) => SignOut(
      ref.read(authRepositoryProvider),
    ));
