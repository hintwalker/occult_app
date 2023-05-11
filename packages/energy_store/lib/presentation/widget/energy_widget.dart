part of energy_store;

class EnergyWidget extends StatelessWidget {
  const EnergyWidget(this.text, {super.key, this.color});
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
