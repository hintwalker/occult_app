import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class BookListModal extends StatelessWidget {
  const BookListModal({
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
      title: translate('books'),
      colorScheme: colorScheme,
      child: child,
    );
  }
}
