part of tauari_auth;

class SignOut {
  final AuthRepository repository;
  const SignOut(this.repository);
  Future<void> call() => repository.signOut();
}
