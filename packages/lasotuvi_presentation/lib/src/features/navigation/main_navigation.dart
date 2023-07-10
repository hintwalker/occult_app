import 'package:flutter/material.dart';
import 'package:lasotuvi_presentation/src/features/navigation/tuvi_drawer_header.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_drawer/tauari_drawer.dart';

import '../../styles/drawer_style_impl.dart';
import 'energy_point_app_bar_action.dart';
import 'menus.dart';
import 'take_screen_title.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({
    super.key,
    required this.screen,
  });
  final Widget Function(String drawerId) screen;

  @override
  Widget build(BuildContext context) {
    return DrawerWidget(
      header: const TuviDrawerHeader(),
      screen: screen,
      title: takeScreenTitle,
      menus: menus,
      style: const DrawerStyleImpl(LasotuviAppStyle.colorScheme),
      appBarTrailing: const EnergyPointAppBarAction(),
    );
  }
}
