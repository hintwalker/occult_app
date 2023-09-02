import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class SignInWithEmail {
  final AuthRepository repository;
  const SignInWithEmail(this.repository);
  Future<UserEntity?> call(String email, String password) =>
      repository.signInWithEmail(email, password);
}
