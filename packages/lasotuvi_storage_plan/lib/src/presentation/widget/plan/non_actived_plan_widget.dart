import 'package:flutter/material.dart';

class NonActivedPlanWidget extends StatelessWidget {
  const NonActivedPlanWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
      child: child,
    );
  }
}
