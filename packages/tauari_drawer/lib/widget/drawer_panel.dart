part of tauari_drawer;

class DrawerPanel extends StatelessWidget {
  const DrawerPanel({
    super.key,
    required this.header,
    required this.menus,
    required this.onMenuTap,
    required this.selectedId,
    required this.style,
    // required this.animationController,
  });
  final Widget header;
  final Iterable<DrawerData> menus;
  final void Function(DrawerData) onMenuTap;
  final String selectedId;
  final DrawerStyle style;
  // final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        header,
        const SizedBox(
          height: 20,
        ),
        ...menus
            .map((e) => DrawerItem(
                  data: e,
                  style: style,
                  selected: () => selectedId == e.id,
                  onTap: () => onMenuTap(e),
                  // animationController: animationController,
                ))
            .toList()
      ],
    );
  }
}
