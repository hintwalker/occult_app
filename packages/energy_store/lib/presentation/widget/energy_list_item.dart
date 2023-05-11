part of energy_store;

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
    return Row(
      children: [
        EnergyWidget(
          Text(ev),
          color: colorScheme.primary,
        ),
        Expanded(
            child: Text(
          price,
          textAlign: TextAlign.center,
        )),
        FilledButton(onPressed: onTap, child: Text(translate('buy'))),
      ],
    );
  }
}
