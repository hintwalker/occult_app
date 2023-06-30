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

  static void openCheckboxChartList(BuildContext context, Tag tag) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) =>
          Material(child: CheckboxChartListBody(tag)),
    );
  }

  static void openChartEditOptions(BuildContext context, Chart chart) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ChartEditOptionsBody(chart),
    );
  }
}
