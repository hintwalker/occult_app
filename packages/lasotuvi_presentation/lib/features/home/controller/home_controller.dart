part of lasotuvi_presentation;

class HomeController extends ChangeNotifier {
  void openChartView({
    required BuildContext context,
    required Chart chart,
  }) {
    ChartHelper.openChartView(context: context, chart: chart);
  }
}
