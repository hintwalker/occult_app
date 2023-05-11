part of tauari_auth;

class SetUser {
  final UserRepository repository;
  const SetUser(this.repository);
  Future<String> call(UserEntity user) async {
    await repository.insert(user.docId, user);
    return user.docId;
  }
}
