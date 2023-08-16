import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class NetworkNotConnectedAlertDialog extends StatelessWidget {
  const NetworkNotConnectedAlertDialog({
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
          child: NoConnectionErrorText(
            translate: translate,
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
            Expanded(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  translate('Ok'),
                ),
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
