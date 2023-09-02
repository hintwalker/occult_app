import 'package:riverpod/riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import '../repository/auth_repository_provider.dart';

final registerOnAuthStateChangedProvider =
    Provider<RegisterOnAuthStateChanged>((ref) {
  // final registerOnAuthStateChanged =
  return RegisterOnAuthStateChanged(ref.read(authRepositoryProvider));
  // registerOnAuthStateChanged((user) async {
  //   final savedUser = await ref.watch(setUserProvider).call(user);
  //   if (kDebugMode) {
  //     print('Signed in ${user.displayName} with uid = $savedUser');
  //   }
  // }, () {});
  // return registerOnAuthStateChanged;
});
