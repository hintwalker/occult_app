import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class NoteSaveConfirmDialog extends StatelessWidget {
  const NoteSaveConfirmDialog({
    super.key,
    required this.translate,
  });
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return BasicConfirmDialog(
      title: translate('confirm'),
      cancelButtonText: translate('cancel'),
      noButtonText: translate('no'),
      yesButtonText: translate('save'),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Center(
                child: Text(translate('msgConfirmSaveNote')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
