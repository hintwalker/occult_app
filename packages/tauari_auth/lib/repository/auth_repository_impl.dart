part of tauari_auth;

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;
  AuthRepositoryImpl(this.dataSource);
  @override
  UserEntity? currentUser() => dataSource.currentUser();

  @override
  StreamSubscription<UserEntity?> onAuthStateChanged(
          Future<String> Function(UserEntity user) onSignIn,
          Function() onSignOut) =>
      dataSource.onAuthStateChanged(onSignIn, onSignOut);

  @override
  Future<UserEntity?> signInRecoveryAttempt() =>
      dataSource.signInRecoveryAttempt();

  @override
  Future<UserEntity?> signInWithGoole() => dataSource.signInWithGoole();

  @override
  Future<void> signOut() => dataSource.signOut();

  @override
  Stream<UserEntity?> onCurrentUser() => dataSource.onCurrentUser();

  @override
  Stream<UserEntity?> authStateChanges() => dataSource.authStateChanges();
}
