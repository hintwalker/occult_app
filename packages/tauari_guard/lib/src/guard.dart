import 'dart:async';

import 'package:tauari_auth/tauari_auth.dart';
import 'review_state.dart';

class Guard {
  const Guard({
    required this.networkChecker,
    required this.signedInUser,
  });
  final Future<bool> Function() networkChecker;
  final UserEntity? Function() signedInUser;

  Future<ReviewState> review() async {
    final connected = await networkChecker();
    final signedIn = signedInUser() != null;
    return ReviewState(connected: connected, signedIn: signedIn);
  }
}
