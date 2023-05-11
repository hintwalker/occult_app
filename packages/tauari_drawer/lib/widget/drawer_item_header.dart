part of tauari_drawer;

class DrawerItemHeader extends StatelessWidget {
  const DrawerItemHeader(
      {super.key, required this.visible, required this.style});
  final bool Function() visible;
  final DrawerStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6.0,
      height: 46.0,
      decoration: BoxDecoration(
        color: visible() ? style.itemHeaderColor : Colors.transparent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(16),
        ),
      ),
    );
  }
}
