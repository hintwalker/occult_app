import 'package:flutter/material.dart';
import 'package:lasotuvi/screen/energy_market_screen.dart';
import 'package:lasotuvi/screen/home_screen.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';

Widget takeScreen(String screenId) {
  switch (screenId) {
    case DrawerIds.home:
      return const HomeScreen();
    case DrawerIds.energyMarket:
      return const EnergyMarketScreen();
    default:
      return const HomeScreen();
  }
}
