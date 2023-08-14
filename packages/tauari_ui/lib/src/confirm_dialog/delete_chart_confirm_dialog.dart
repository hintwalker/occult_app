import 'package:flutter/material.dart';

import '../widget/basic_confirm_dialog.dart';

class DeleteDataConfirmDialog extends StatelessWidget {
  const DeleteDataConfirmDialog({
    super.key,
    required this.translate,
    required this.message,
    required this.confirmText,
  });
  final String message;
  final String confirmText;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return BasicConfirmDialog(
      title: translate('confirm'),
      cancelButtonText: translate('no'),
      noButtonText: null,
      yesButtonText: translate('yes'),
      children: [
        Text(
          message,
          // translate('warningDeleteChart'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          confirmText,
          // translate('warningDeleteChart'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
