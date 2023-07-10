import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import 'auth_repository_provider.dart';

final authNotifierProvider =
    StateNotifierProvider.autoDispose<AuthNotifier, AsyncValue<AuthState>>(
        (ref) {
  final notifier = AuthNotifier(repository: ref.read(authRepositoryProvider));
  notifier.init();
  return notifier;
});
// final authNotifierProvider =
//     StateNotifierProvider<AuthNotifier, TuviUser?>((ref) {
//   final authRepository = ref.watch(authRepositoryProvider);
//   return AuthNotifier(
//     authRepository.currentUser(),
//     signInWithGoogle: SignInWithGoogle(authRepository),
//     signOutUseCase: SignOut(authRepository),
//   );
// });
