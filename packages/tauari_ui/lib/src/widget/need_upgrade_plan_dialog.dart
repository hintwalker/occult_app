import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class NeedUpgradePlanDialog extends StatelessWidget {
  const NeedUpgradePlanDialog({
    super.key,
    // required this.goToPlanMarket,
    required this.translate,
  });
  final String Function(String) translate;
  // final void Function() goToPlanMarket;
  @override
  Widget build(BuildContext context) {
    return BasicDialog(
      title: translate('alert'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(translate('needUpgradePlan')),
        ),
        const SizedBox(
          height: 18.0,
        ),
        const Divider(
          height: 1.0,
          thickness: 1.0,
        ),
        // const SizedBox(
        //   height: 18.0,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  translate('Ok'),
                ),
              ),
            ),
            // Expanded(
            //     child: FilledButton.icon(
            //   onPressed: goToPlanMarket,
            //   icon: const Icon(Icons.upgrade),
            //   label: Text(translate('upgrade')),
            // ))
          ],
        ),
        // const SizedBox(
        //   height: 18.0,
        // ),
      ],
    );
  }
}
