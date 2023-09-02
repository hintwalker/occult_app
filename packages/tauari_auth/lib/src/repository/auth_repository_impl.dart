import 'dart:async';

import '../entity/user_entity.dart';
import '../source/auth_data_source.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;
  AuthRepositoryImpl(this.dataSource);
  @override
  UserEntity? currentUser() => dataSource.currentUser();

  @override
  StreamSubscription<UserEntity?> onAuthStateChanged(
          FutureOr<String> Function(UserEntity user) onSignIn,
          Function() onSignOut) =>
      dataSource.onAuthStateChanged(onSignIn, onSignOut);

  @override
  Future<UserEntity?> signInRecoveryAttempt() =>
      dataSource.signInRecoveryAttempt();

  @override
  Future<UserEntity?> signInWithGoole() => dataSource.signInWithGoole();

  @override
  Future<void> signOut() => dataSource.signOut();

  @override
  Stream<UserEntity?> onCurrentUser() => dataSource.onCurrentUser();

  @override
  Stream<UserEntity?> authStateChanges() => dataSource.authStateChanges();

  @override
  Future<UserEntity?> signInWithEmail(String email, String password) =>
      dataSource.signInWithEmail(email, password);
}
