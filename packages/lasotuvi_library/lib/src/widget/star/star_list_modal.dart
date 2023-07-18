import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class StarListModal extends StatelessWidget {
  const StarListModal({
    super.key,
    required this.colorScheme,
    required this.translate,
    required this.child,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BasicModal(
      title: translate('luanVeCacSao'),
      colorScheme: colorScheme,
      child: child,
    );
  }
}
