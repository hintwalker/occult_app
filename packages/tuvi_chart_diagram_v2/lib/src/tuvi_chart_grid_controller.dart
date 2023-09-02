import 'package:flutter/material.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import 'execute_build_chart.dart';
import 'house/house_controller.dart';

class TuviChartGridController extends ChangeNotifier {
  final Map<HousePosition, HouseController> houseControllers = {};
  TuviChartGridController({this.options});
  Map<String, dynamic>? options;
  HousePosition currentSelectedSource = HousePosition.unknown();

  void insert(HouseController controller) {
    houseControllers[controller.house.position] = controller;
    controller.attachTo(this);
  }

  void select(House house) {
    clearAllSelected();
    if (currentSelectedSource != house.position) {
      currentSelectedSource = house.position;
      // final HousePair pair = house.findPair();
      final HouseTriad triad = house.findTriad();
      final HousePair opposition = house.findOpposition();
      houseControllers[house.position]?.enableSelected();
      houseControllers[house.position]?.enableSource();
      // selectPair(pair, true);
      selectTriad(triad, true);
      selectOpposition(opposition, true);
    } else {
      currentSelectedSource = HousePosition.unknown();
    }
  }

  void clearAllSelected() {
    houseControllers.forEach((key, value) {
      value.unselect();
    });
  }

  void selectPair(HousePair pair, bool selected) {
    houseControllers[pair.other]?.select(selected, false);
  }

  void selectTriad(HouseTriad triad, bool selected) {
    houseControllers[triad.nextClockWise]?.select(selected, false);
    houseControllers[triad.other]?.select(selected, false);
  }

  void selectOpposition(HousePair opposition, bool selected) {
    houseControllers[opposition.other]?.select(selected, false);
  }

  Future<TuViChart> future(Chart data) async {
    return await executeBuildChart(
      data,
      config: SkyConfig.basic().copyWith(
        options: options,
      ),
    );
  }

  void updateOptions(Map<String, dynamic> options) {
    this.options = options;
    notifyListeners();
  }

  void getSavedOptions() {}
}
