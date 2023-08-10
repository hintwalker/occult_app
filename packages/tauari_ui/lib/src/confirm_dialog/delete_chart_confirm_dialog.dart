import 'package:flutter/material.dart';

import '../widget/basic_confirm_dialog.dart';

class DeleteChartConfirmDialog extends StatelessWidget {
  const DeleteChartConfirmDialog({
    super.key,
    required this.translate,
  });
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
          translate('warningDeleteChart'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
