part of tauari_auth;

class RegisterOnAuthStateChanged {
  final AuthRepository repository;
  const RegisterOnAuthStateChanged(this.repository);
  StreamSubscription<UserEntity?> call(
          Future<String> Function(UserEntity user) onSignIn,
          Function() onSignOut) =>
      repository.onAuthStateChanged(onSignIn, onSignOut);
}
