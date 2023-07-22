import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_auth_widget/tauari_auth_widget.dart';
import '../usecase/register_on_auth_state_changed.dart';
import '../usecase/on_current_user.dart';
import '../usecase/setup_init_user.dart';

final authControllerProvider =
    ChangeNotifierProvider.autoDispose<AuthController>(
  (ref) => AuthController(
    onCurrentUser: ref.read(onCurrentUserProvider),
    registerOnAuthStateChanged: ref.read(registerOnAuthStateChangedProvider),
    setupInitUser: ref.read(setupInitUserProvider),
  ),
);
