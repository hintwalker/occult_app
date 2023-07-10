import 'package:flutter/material.dart';
import 'package:tauari_translate/tauari_translate.dart';

import 'drawer_ids.dart';

Widget takeScreenTitle(String screenId) {
  switch (screenId) {
    case DrawerIds.home:
      return Text(translate('home'));
    case DrawerIds.energyMarket:
      return Text(translate('energyMarket'));
    case DrawerIds.storagePlanMarket:
      return Text(translate('storagePlanMarket'));
    default:
      return const Text('');
  }
}
