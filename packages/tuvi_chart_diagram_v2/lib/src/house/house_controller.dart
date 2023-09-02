import 'package:flutter/material.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../tuvi_chart_grid_controller.dart';

class HouseController extends ChangeNotifier {
  bool selected = false;
  bool source = false;
  // final HousePosition currentPosition;
  final House house;
  late final TuviChartGridController gridController;
  HouseController(this.house);

  void attachTo(TuviChartGridController gridController) {
    this.gridController = gridController;
  }

  void enableSelected() {
    selected = true;
  }

  void enableSource() {
    source = true;
  }

  void select(bool selected, [bool? asSource]) {
    // if (asSource) {
    //   if (source) {
    //     selected = !selected;
    //   } else {
    //     selected = true;
    //   }
    // } else {
    //   selected = true;
    // }
    this.selected = selected;
    if (asSource != null) {
      source = asSource;
      if (asSource) {
        gridController.select(house);
      }
    }

    notifyListeners();
  }

  void unselect() {
    selected = false;
    source = false;
    notifyListeners();
  }
}
