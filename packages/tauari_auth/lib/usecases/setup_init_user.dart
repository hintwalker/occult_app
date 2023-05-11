part of tauari_auth;

class SetupInitUser {
  final UserRepository repository;
  SetupInitUser(this.repository);
  Future<String> call(UserEntity user) => repository.setupInitUser(user);
}
