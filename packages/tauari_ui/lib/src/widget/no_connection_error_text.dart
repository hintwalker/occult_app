import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class NoConnectionErrorText extends StatelessWidget {
  const NoConnectionErrorText({
    super.key,
    required this.translate,
    this.textColor,
  });
  final String Function(String) translate;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ErrorTextWidget(
      message: translate('noConnection'),
      textColor: textColor,
    );
  }
}
