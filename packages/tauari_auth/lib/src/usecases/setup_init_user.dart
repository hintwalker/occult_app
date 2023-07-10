import '../entity/user_entity.dart';
import '../repository/user_repository.dart';

class SetupInitUser {
  final UserRepository repository;
  SetupInitUser(this.repository);
  Future<String> call(UserEntity user) => repository.setupInitUser(user);
}
