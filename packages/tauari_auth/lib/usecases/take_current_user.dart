part of tauari_auth;

class TakeCurrentUser {
  const TakeCurrentUser(this.repository);
  final AuthRepository repository;
  UserEntity? call() => repository.currentUser();
}
