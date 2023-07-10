import 'dart:async';

import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class RegisterOnAuthStateChanged {
  final AuthRepository repository;
  const RegisterOnAuthStateChanged(this.repository);
  StreamSubscription<UserEntity?> call(
          FutureOr<String> Function(UserEntity user) onSignIn,
          Function() onSignOut) =>
      repository.onAuthStateChanged(onSignIn, onSignOut);
}
