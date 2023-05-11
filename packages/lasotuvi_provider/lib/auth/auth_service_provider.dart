part of lasotuvi_provider;

final authServiceProvider = Provider<FirebaseAuthService>(
  (ref) => FirebaseAuthService(
    googleSignIn: GoogleSignIn(scopes: [
      'email',
    ]), // 'https://www.googleapis.com/auth/contacts.readonly']),
    firebaseAuth: ref.read(firebaseAuthProvider),
  ),
);
