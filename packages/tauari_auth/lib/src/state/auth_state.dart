import '../entity/user_entity.dart';

class AuthState {
  const AuthState(this.user);
  final UserEntity? user;
}
