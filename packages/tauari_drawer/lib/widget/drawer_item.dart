part of tauari_drawer;

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.data,
    required this.onTap,
    required this.selected,
    required this.style,
    required this.animationController,
  });
  final DrawerData data;
  final void Function() onTap;
  final bool Function() selected;
  final DrawerStyle style;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  DrawerItemHeader(
                    visible: selected,
                    style: style,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  DrawerIcon(
                    itemData: data,
                    style: style,
                    selected: selected,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  DrawerItemTitle(
                    itemData: data,
                    style: style,
                    selected: selected,
                  )
                ],
              ),
            ),
            DrawerItemHighlight(
              visible: selected,
              animationController: animationController,
              style: style,
            )
          ],
        ),
      ),
    );
    // return Container(
    //   child: ListTile(
    //   leading: leading,
    //   title: title,
    //   trailing: trailing,
    //   onTap: onTap,
    // ),);
  }
}
