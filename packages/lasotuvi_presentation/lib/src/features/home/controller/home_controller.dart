import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../chart/navigation/chart_navigation.dart';

class HomeController extends ChangeNotifier {
  void openChartView({
    required BuildContext context,
    required Chart chart,
  }) {
    ChartNavigation.openChartView(context: context, chart: chart);
  }
}
