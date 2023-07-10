import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import 'auth_repository_provider.dart';

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
