import 'package:tauari_auth/src/entity/user_entity.dart';

import '../repository/auth_repository.dart';

class OnCurrentUser {
  const OnCurrentUser(this.repository);
  final AuthRepository repository;
  Stream<UserEntity?> call() => repository.onCurrentUser();
}
