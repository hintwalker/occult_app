import 'dart:async';

import '../entity/user_entity.dart';

abstract class AuthRepository {
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
  Future<UserEntity?> signInWithEmail(String email, String password);
}
