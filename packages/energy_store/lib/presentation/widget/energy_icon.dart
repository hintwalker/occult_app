part of energy_store;

class EnergyIcon extends StatelessWidget {
  const EnergyIcon({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/water_ec.png',
      package: 'energy_store',
      width: 20,
      height: 20,
      color: color,
    );
  }
}
