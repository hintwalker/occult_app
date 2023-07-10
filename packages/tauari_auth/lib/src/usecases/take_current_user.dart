import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class TakeCurrentUser {
  const TakeCurrentUser(this.repository);
  final AuthRepository repository;
  UserEntity? call() => repository.currentUser();
}
