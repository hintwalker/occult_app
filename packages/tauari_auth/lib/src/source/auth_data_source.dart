import 'dart:async';

import '../entity/user_entity.dart';

abstract class AuthDataSource {
  Future<UserEntity?> signInWithGoole();
  Future<void> signOut();
  StreamSubscription<UserEntity?> onAuthStateChanged(
    FutureOr<String> Function(UserEntity user) onSignIn,
    Function() onSignOut,
  );
  UserEntity? currentUser();

  Future<UserEntity?> signInRecoveryAttempt();

  Stream<UserEntity?> onCurrentUser();
  Stream<UserEntity?> authStateChanges();
}
