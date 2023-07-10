import 'package:flutter/material.dart';

class RestorableStatelessWidget extends StatelessWidget {
  const RestorableStatelessWidget({
    super.key,
    required this.child,
    this.restorationId,
  });
  final String? restorationId;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(restorationId: restorationId, child: child);
  }
}
