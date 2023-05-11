part of tauari_auth;

abstract class AuthDataSource {
  Future<UserEntity?> signInWithGoole();
  Future<void> signOut();
  StreamSubscription<UserEntity?> onAuthStateChanged(
    Future<String> Function(UserEntity user) onSignIn,
    Function() onSignOut,
  );
  UserEntity? currentUser();

  Future<UserEntity?> signInRecoveryAttempt();

  Stream<UserEntity?> onCurrentUser();
  Stream<UserEntity?> authStateChanges();
}
