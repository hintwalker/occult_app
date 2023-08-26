import 'package:flutter/material.dart';

import 'basic_dialog.dart';

class NeedSignInAlertDialog extends StatelessWidget {
  const NeedSignInAlertDialog({
    super.key,
    // required this.colorScheme,
    required this.translate,
    required this.signInButton,
    required this.onCancel,
  });
  final String Function(String) translate;
  final Widget? signInButton;
  final void Function() onCancel;
  // final ColorScheme colorScheme;
  @override
  Widget build(BuildContext context) {
    return BasicDialog(
      title: translate('alert'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            translate('needSignIn'),
            style: const TextStyle(fontSize: 18),
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
              onPressed: () {
                Navigator.pop(context);
                onCancel();
              },
              child: Text(
                translate('close'),
              ),
            ),
            if (signInButton != null)
              const SizedBox(
                width: 8.0,
              ),
            if (signInButton != null) signInButton!
          ],
        ),
        // const SizedBox(
        //   height: 8.0,
        // ),
      ],
    );
  }
}
