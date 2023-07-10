import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';
import '../state/auth_state.dart';

class AuthNotifier extends StateNotifier<AsyncValue<AuthState>> {
  // late SignInWithGoogle _signInWithGoogle;
  // late SignOut _signOutUseCase;
  final AuthRepository repository;

  AuthNotifier({required this.repository}) : super(const AsyncValue.loading());

  FutureOr<void> init() async {
    state = const AsyncValue.loading();
    final user = repository.currentUser();
    state = AsyncValue.data(AuthState(user));
  }

  // late String _signInMethod;
  // late SignInRecoveryAttempt _signInRecoveryAttempt;

  // @override
  // FutureOr<UserEntity?> build() async {
  //   // _signInWithGoogle = ref.watch(signInWithGoogleProvider);
  //   // _signOutUseCase = ref.watch(signOutProvider);
  //   return null;

  //   // return await signIn(
  //   //   allowToForward: (user) async {
  //   //     return Future.value(true);
  //   //   },
  //   // );
  // }
  Future<UserEntity?> signIn() async {
    state = const AsyncValue.loading();
    final user = await repository.signInWithGoole();
    state = AsyncValue.data(AuthState(user));
    return user;
  }

  // Future<UserEntity?> signIn(
  //     {Future<bool> Function(UserEntity?)? allowToForward}) async {
  //   final user = await _signInWithGoogle();

  //   if (allowToForward == null) {
  //     state = AsyncValue.data(user);
  //     return user;
  //   } else {
  //     final allow = await allowToForward(user);
  //     if (allow) {
  //       state = AsyncValue.data(user);
  //       return user;
  //     }
  //     await signOut();
  //     return null;
  //   }
  //   // return null;
  // }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    await repository.signOut();
    state = const AsyncValue.data(AuthState(null));
  }
}

// class AuthNotifier extends StateNotifier<UserEntity?> {
//   final SignInWithGoogle signInWithGoogle;
//   final SignOut signOutUseCase;
//   AuthNotifier(
//     UserEntity? user, {
//     required this.signInWithGoogle,
//     required this.signOutUseCase,
//   }) : super(user);

//   Future<void> signIn() async {
//     state = await signInWithGoogle();
//   }

//   Future<void> signOut() async {
//     await signOutUseCase();
//     state = null;
//   }
// }
