import 'package:flutter/material.dart';
import 'package:lasotuvi/screen/home_screen.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';

Widget takeScreen(String screenId) {
  switch (screenId) {
    case DrawerIds.home:
      return const HomeScreen();
    default:
      return const HomeScreen();
  }
}
