import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tauari_utils/tauari_utils.dart';

class ActionsBanner extends StatelessWidget {
  const ActionsBanner({
    super.key,
    required this.plan,
    required this.canAfford,
    required this.onBuyMoreEnergy,
    required this.onCancel,
    required this.onSubmit,
    required this.translate,
  });

  final StoragePlan plan;
  final bool canAfford;
  final void Function() onSubmit;
  final void Function() onCancel;
  final void Function() onBuyMoreEnergy;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: onCancel,
          child: Text(
            translate('cancel'),
          ),
        ),
        BasicFutureBuilder(
          future: availableNetwork(),
          child: (network) => network == null || !network
              ? OutlinedButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.wifi_off_outlined),
                  label: Text(
                    translate('noNetwork'),
                  ),
                )
              : canAfford
                  ? FilledButton.icon(
                      onPressed: onSubmit,
                      icon: const Icon(Icons.done),
                      label: Text(
                        translate('pay'),
                      ),
                    )
                  : OutlinedButton.icon(
                      onPressed: onBuyMoreEnergy,
                      icon: const Icon(Icons.energy_savings_leaf_outlined),
                      label: Text(
                        translate('buyMoreEnergyPoint'),
                      ),
                    ),
        )
      ],
    );
  }
}
