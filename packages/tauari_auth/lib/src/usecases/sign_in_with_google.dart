import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository repository;
  const SignInWithGoogle(this.repository);
  Future<UserEntity?> call() => repository.signInWithGoole();
}
