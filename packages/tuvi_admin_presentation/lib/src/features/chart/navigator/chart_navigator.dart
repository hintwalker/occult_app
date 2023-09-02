/*
 * Created on Wed Aug 30 2023
 *
 * Copyright (c) 2023 T A U A R I
 */

import 'package:flutter/material.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';
import '../screen/chart_creation_modal_screen.dart';

class ChartNavigator {
  static void openChartCreationScreen(BuildContext context) {
    showDialog(
        context: context, builder: (_) => const ChartCreationModalScreen());
    // context.pushNamed(RouteName.chartCreation);
  }

  static void openChartView({
    required BuildContext context,
    // required WidgetRef ref,
    required Chart chart,
    required bool saveLastView,
  }) {
    // showDialog(
    //     context: context,
    //     builder: (context) => ChartViewModalScreen(
    //           chart: chart,
    //           saveLastView: saveLastView,
    //         ),
    //     routeSettings: const RouteSettings(name: RouteName.chartView));
  }
}
