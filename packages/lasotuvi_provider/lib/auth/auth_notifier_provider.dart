part of lasotuvi_provider;

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
