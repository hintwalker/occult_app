part of tauari_auth;

abstract class AuthRepository {
  Future<UserEntity?> signInWithGoole();
  Future<void> signOut();
  StreamSubscription<UserEntity?> onAuthStateChanged(
    FutureOr<String> Function(UserEntity user) onSignIn,
    Function() onSignOut,
  );
  UserEntity? currentUser();

  Future<UserEntity?> signInRecoveryAttempt();
  Stream<UserEntity?> onCurrentUser();
  Stream<UserEntity?> authStateChanges();
}
