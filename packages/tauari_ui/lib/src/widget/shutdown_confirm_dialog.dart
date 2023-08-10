import 'package:flutter/material.dart';

import 'simple_dialog_header.dart';

class ShutdownConfirmDialog extends StatelessWidget {
  const ShutdownConfirmDialog({
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
      contentPadding: const EdgeInsets.all(24.0),
      children: [
        Text(
          translate('msgExitApp'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 48.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                translate('no'),
              ),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                translate('exit'),
              ),
            ),
          ],
        )
        // Expanded(
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Column(
        //       children: [

        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
