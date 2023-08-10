import 'package:flutter/material.dart';

import 'basic_dialog.dart';

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
    return BasicDialog(
      title: translate('alert'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            translate('needSignIn'),
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        const Divider(
          height: 1.0,
          thickness: 1.0,
        ),
        // const SizedBox(
        //   height: 8.0,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                translate('Ok'),
              ),
            ),
          ],
        ),
        // const SizedBox(
        //   height: 8.0,
        // ),
      ],
    );
  }
}
