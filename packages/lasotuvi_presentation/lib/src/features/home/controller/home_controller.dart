import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../../helper/chart_helper.dart';

class HomeController extends ChangeNotifier {
  void openChartView({
    required BuildContext context,
    required Chart chart,
  }) {
    ChartHelper.openChartView(context: context, chart: chart);
  }
}
