import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lasotuvi_presentation/src/features/navigation/tuvi_drawer_header.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_drawer/tauari_drawer.dart';
import 'package:tauari_translate/tauari_translate.dart';

import '../../styles/drawer_style_impl.dart';
import '../navigation/drawer_ids.dart';
import '../navigation/energy_point_app_bar_action.dart';
import '../navigation/menus.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({
    super.key,
    this.restorationId,
    required this.child,
  });
  final String? restorationId;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RestorationScope(
      restorationId: restorationId,
      child: Scaffold(
        body: DrawerScaffold(
            header: const TuviDrawerHeader(),
            title: (id) => Text(getScreenTitle(id)),
            menus: menus,
            style: const DrawerStyleImpl(LasotuviAppStyle.colorScheme),
            onMenuTap: (menu) => context.goNamed(menu),
            controller: ref.read(mainDrawerControllerProvider),
            appBarTrailing: const EnergyPointAppBarAction(),
            child: child),
      ),
    );
  }

  String getScreenTitle(String id) {
    switch (id) {
      case DrawerIds.home:
        return translate('home');
      case DrawerIds.charts:
        return translate('charts');
      case DrawerIds.energyMarket:
        return translate('energyMarket');
      case DrawerIds.library:
        return translate('library');
      case DrawerIds.notes:
        return translate('notes');
      case DrawerIds.tags:
        return translate('tags');
      case DrawerIds.storagePlanMarket:
        return translate('storagePlanMarket');
      default:
        return '';
    }
  }
}
