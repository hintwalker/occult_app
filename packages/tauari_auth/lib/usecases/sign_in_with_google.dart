part of tauari_auth;

class SignInWithGoogle {
  final AuthRepository repository;
  const SignInWithGoogle(this.repository);
  Future<UserEntity?> call() => repository.signInWithGoole();
}
