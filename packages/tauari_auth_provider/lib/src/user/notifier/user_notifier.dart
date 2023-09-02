import 'package:riverpod/riverpod.dart';
import 'package:tauari_auth_presentation/tauari_auth_presentation.dart';
import 'package:tauari_auth_provider/src/user/usecase/on_current_user.dart';
import 'package:tauari_auth_provider/src/auth/usecase/register_on_auth_state_changed.dart';

import '../usecase/setup_init_user.dart';

final userNotifierProvier = StateNotifierProvider<UserNotifier, UserState>(
  (ref) => UserNotifier(
    onCurrentUser: ref.read(onCurrentUserProvider),
    registerOnAuthStateChanged: ref.read(registerOnAuthStateChangedProvider),
    setupInitUser: ref.read(setupInitUserProvider),
  ),
);
