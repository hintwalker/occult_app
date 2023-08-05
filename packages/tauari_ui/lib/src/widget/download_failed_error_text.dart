import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class DownloadFailedErrorText extends StatelessWidget {
  const DownloadFailedErrorText({
    super.key,
    required this.translate,
    required this.textColor,
  });
  final String Function(String) translate;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ErrorTextWidget(
      message: translate('downloadFailed'),
      textColor: textColor,
    );
  }
}
