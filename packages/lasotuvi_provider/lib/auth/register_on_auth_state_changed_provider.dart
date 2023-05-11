part of lasotuvi_provider;

final registerOnAuthStateChangedProvider =
    Provider<RegisterOnAuthStateChanged>((ref) {
  final registerOnAuthStateChanged =
      RegisterOnAuthStateChanged(ref.read(authRepositoryProvider));
  // registerOnAuthStateChanged((user) async {
  //   final savedUser = await ref.watch(setUserProvider).call(user);
  //   if (kDebugMode) {
  //     print('Signed in ${user.displayName} with uid = $savedUser');
  //   }
  // }, () {});
  return registerOnAuthStateChanged;
});
