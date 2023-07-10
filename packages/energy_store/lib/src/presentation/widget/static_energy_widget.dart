import 'package:flutter/material.dart';

import 'energy_icon.dart';

class StaticEnergyWidget extends StatelessWidget {
  const StaticEnergyWidget(this.text, {super.key, this.color});
  final Color? color;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EnergyIcon(
          color: color,
        ),
        text
      ],
    );
  }
}
