import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_auth_widget/tauari_auth_widget.dart';

abstract class AdminAuthDependedState<T extends ConsumerStatefulWidget>
    extends AuthDependedState<T> {
  @override
  RegisterOnAuthStateChanged get registerOnAuthStateChanged =>
      ref.read(registerOnAuthStateChangedProvider);
}
