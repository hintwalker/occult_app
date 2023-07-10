import 'package:flutter/material.dart';

import '../drawer_data.dart';
import '../drawer_style.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon(
      {super.key,
      required this.itemData,
      required this.style,
      required this.selected});
  final DrawerData itemData;
  final DrawerStyle style;
  final bool Function() selected;

  @override
  Widget build(BuildContext context) {
    return itemData.isAssetsImage && itemData.image != null
        ? SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(itemData.image!,
                color: selected() ? style.selectedIconColor : style.iconColor),
          )
        : Icon(itemData.icon?.icon,
            color: selected() ? style.selectedIconColor : style.iconColor);
  }
}
