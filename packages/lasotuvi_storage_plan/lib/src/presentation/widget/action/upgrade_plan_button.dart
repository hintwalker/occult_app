import 'package:flutter/material.dart';

class UpgradePlanButton extends StatelessWidget {
  const UpgradePlanButton({
    super.key,
    required this.translate,
    required this.onTap,
  });

  final String Function(String) translate;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onTap,
      icon: const Icon(Icons.upgrade),
      label: Text(
        translate('upgradeNow'),
      ),
    );
  }
}
