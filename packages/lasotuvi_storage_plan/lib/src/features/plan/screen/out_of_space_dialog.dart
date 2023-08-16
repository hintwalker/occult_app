import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/src/features/plan/widget/upgrade_plan_button.dart';
import 'package:tauari_ui/tauari_ui.dart';

class OutOfSpaceDialog extends StatelessWidget {
  const OutOfSpaceDialog({
    super.key,
    required this.translate,
    required this.colorScheme,
    required this.goToPlanList,
    this.message,
  });
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function() goToPlanList;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return BasicDialog(
      title: translate('alert'),
      children: [
        Icon(
          Icons.disc_full,
          color: colorScheme.error,
          size: 36.0,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          translate('outOfSpace'),
          style: TextStyle(
            fontSize: 20,
            color: colorScheme.error,
          ),
        ),
        if (message != null)
          const SizedBox(
            height: 8.0,
          ),
        if (message != null)
          Text(
            message!,
            style: const TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
        const SizedBox(
          height: 24.0,
        ),
        const Divider(
          height: 1.0,
          thickness: 1.0,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              child: Text(
                translate('close'),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            UpgradePlanButton(translate: translate, onTap: goToPlanList),
          ],
        )
      ],
    );
  }
}
