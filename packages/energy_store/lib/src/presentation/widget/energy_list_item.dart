import 'package:flutter/material.dart';

import 'static_energy_widget.dart';

class EnergyListItem extends StatelessWidget {
  const EnergyListItem({
    super.key,
    required this.ev,
    required this.price,
    required this.colorScheme,
    required this.onTap,
    required this.translate,
  });
  final String ev;
  final String price;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          StaticEnergyWidget(
            Text(
              ev,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.primary),
            ),
            color: colorScheme.primary,
          ),
          Expanded(
              child: Text(
            price,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          )),
          FilledButton(onPressed: onTap, child: Text(translate('buy'))),
        ],
      ),
    );
  }
}
