import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class BookReaderModal extends StatelessWidget {
  const BookReaderModal({
    super.key,
    required this.title,
    required this.colorScheme,
    required this.child,
  });
  final String title;
  final ColorScheme colorScheme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BasicModal(
      title: title,
      colorScheme: colorScheme,
      child: child,
    );
  }
}
