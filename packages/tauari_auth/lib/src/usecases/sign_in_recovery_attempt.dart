import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class SignInRecoveryAttempt {
  final AuthRepository repository;
  const SignInRecoveryAttempt(this.repository);
  Future<UserEntity?> call() => repository.signInRecoveryAttempt();
}
