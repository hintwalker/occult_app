import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../controller/auth_controller.dart';

class UserAuthWidgetUsingController extends ConsumerStatefulWidget {
  const UserAuthWidgetUsingController({
    super.key,
    this.syncData,
    required this.controller,
    required this.signInWidget,
    required this.signOutWidget,
  });
  final AuthController controller;

  final Future<void> Function(String uid)? syncData;
  final Widget signInWidget;
  final Widget Function(UserEntity) signOutWidget;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserAuthWidgetState();
}

class _UserAuthWidgetState
    extends ConsumerState<UserAuthWidgetUsingController> {
  @override
  void initState() {
    super.initState();
    widget.controller.register(widget.syncData);
  }

  @override
  void dispose() {
    widget.controller.unregister();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasicStreamBuilder<UserEntity?>(
      stream: widget.controller.stream(),
      childIfNull: widget.signInWidget,
      child: (user) {
        if (user == null) {
          return widget.signInWidget;
        } else {
          return widget.signOutWidget(user);
        }
      },
    );
  }
}
