import '../entity/user_entity.dart';
import '../repository/user_repository.dart';

class SetUser {
  final UserRepository repository;
  const SetUser(this.repository);
  Future<String> call(UserEntity user) async {
    await repository.insert(user.docId, user, false);
    return user.docId;
  }
}
