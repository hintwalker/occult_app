import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class NeedToBuyMoreEnergyDialog extends StatelessWidget {
  const NeedToBuyMoreEnergyDialog({
    super.key,
    required this.onBuyMoreEnergy,
    required this.translate,
  });
  final String Function(String) translate;
  final void Function() onBuyMoreEnergy;
  @override
  Widget build(BuildContext context) {
    return BasicDialog(
      title: translate('alert'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(translate('notEnoughEnergy')),
        ),
        const SizedBox(
          height: 18.0,
        ),
        const Divider(
          height: 1.0,
          thickness: 1.0,
        ),
        const SizedBox(
          height: 18.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  translate('cancel'),
                ),
              ),
            ),
            Expanded(
                child: FilledButton(
              onPressed: onBuyMoreEnergy,
              child: Text(translate('buyEnergy')),
            ))
          ],
        ),
        const SizedBox(
          height: 18.0,
        ),
      ],
    );
  }
}
