import 'package:flutter/material.dart';

import 'simple_dialog_header.dart';

class NeedSignInAlertDialog extends StatelessWidget {
  const NeedSignInAlertDialog({
    super.key,
    required this.colorScheme,
    required this.translate,
  });
  final String Function(String) translate;
  final ColorScheme colorScheme;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: SimpleDialogHeader(translate('alert')),
      children: [Text(translate('needSignIn'))],
    );
  }
}
