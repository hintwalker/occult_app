import 'package:flutter/material.dart';
import 'package:tauari_drawer/tauari_drawer.dart';
import 'package:tauari_translate/tauari_translate.dart';

import 'drawer_ids.dart';

final menus = [
  DrawerData(
      id: DrawerIds.home,
      title: translate('home'),
      icon: const Icon(Icons.home)),
  DrawerData(
      id: DrawerIds.energyMarket,
      title: translate('energyMarket'),
      icon: const Icon(Icons.water_drop)),
  DrawerData(
      id: DrawerIds.storagePlanMarket,
      title: translate('storagePlanMarket'),
      icon: const Icon(Icons.subscriptions)),
  DrawerData(
      id: DrawerIds.charts,
      title: translate('charts'),
      icon: const Icon(Icons.people_alt)),
  // DrawerData(
  //     id: DrawerIds.commentaries,
  //     title: translate('commentary'),
  //     icon: const Icon(Icons.self_improvement)),
  DrawerData(
      id: DrawerIds.notes,
      title: translate('notes'),
      icon: const Icon(Icons.sticky_note_2)),
  DrawerData(
      id: DrawerIds.tags,
      title: translate('tags'),
      icon: const Icon(Icons.label)),
  // DrawerData(
  //     id: DrawerIds.books,
  //     title: translate('books'),
  //     icon: const Icon(Icons.menu_book_sharp)),
  DrawerData(
      id: DrawerIds.library,
      title: translate('library'),
      icon: const Icon(Icons.library_books)),
  // DrawerData(
  //     id: DrawerIds.changeDate,
  //     title: translate('changeDate'),
  //     icon: const Icon(Icons.edit_calendar)),
  // DrawerData(
  //     id: DrawerIds.groupStars,
  //     title: translate('groupStars'),
  //     icon: const Icon(Icons.auto_awesome)),
];
