import 'package:flutter/material.dart';

import '../drawer_data.dart';
import '../drawer_style.dart';

class DrawerItemTitle extends StatelessWidget {
  const DrawerItemTitle({
    super.key,
    required this.itemData,
    required this.selected,
    required this.style,
  });
  final DrawerData itemData;
  final bool Function() selected;
  final DrawerStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      itemData.title,
      style: TextStyle(
        fontWeight: style.itemFontWeight,
        fontSize: style.itemFontSize,
        color: selected() ? style.selectedIconColor : style.iconColor,
      ),
      textAlign: TextAlign.left,
    );
  }
}
