import 'package:flutter/material.dart';
import 'energy_market.dart';
import 'home.dart';
import 'storage_plan_market.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show DrawerIds;

Widget takeScreen(String screenId) {
  switch (screenId) {
    case DrawerIds.home:
      return const HomeScreen();
    case DrawerIds.energyMarket:
      return const EnergyMarketScreen();
    case DrawerIds.storagePlanMarket:
      return const StoragePlanMarketScreen();
    default:
      return const HomeScreen();
  }
}
