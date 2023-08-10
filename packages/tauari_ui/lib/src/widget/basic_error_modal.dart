import 'package:flutter/material.dart';

import '../../tauari_ui.dart';

class BasicErrorModal extends StatelessWidget {
  const BasicErrorModal({
    super.key,
    required this.colorScheme,
    this.message,
  });
  final ColorScheme colorScheme;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return BasicModal(
      title: '',
      colorScheme: colorScheme,
      child: Center(
        child: ErrorTextWidget(
          message: message,
        ),
      ),
    );
  }
}
