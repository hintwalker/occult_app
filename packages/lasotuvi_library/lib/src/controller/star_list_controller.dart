import 'package:flutter/material.dart';
import '../entity/star_item.dart';
import '../usecase/take_all_star_list.dart';

class StarListController extends ChangeNotifier {
  StarListController(this.takeAllStarMenu);
  final TakeAllStarList takeAllStarMenu;

  Future<Iterable<StarItem>> allData() => takeAllStarMenu();
}
