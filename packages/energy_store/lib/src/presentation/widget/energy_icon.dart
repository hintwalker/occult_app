import 'package:flutter/material.dart';

class EnergyIcon extends StatelessWidget {
  const EnergyIcon({super.key, this.color, this.size});
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/water_ec.png',
      package: 'energy_store',
      width: size ?? 20.0,
      height: size ?? 20.0,
      color: color,
    );
  }
}
