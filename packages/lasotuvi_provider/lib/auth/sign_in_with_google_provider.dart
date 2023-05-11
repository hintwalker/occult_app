part of lasotuvi_provider;

final signInWithGoogleProvider = Provider<SignInWithGoogle>(
    (ref) => SignInWithGoogle(ref.read(authRepositoryProvider)));
