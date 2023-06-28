part of lasotuvi_presentation;

class ChartHelper {
  static void openChartView({
    required BuildContext context,
    // required WidgetRef ref,
    required Chart chart,
  }) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) =>
          ChartViewBody(chart: chart),
    );
  }
}
