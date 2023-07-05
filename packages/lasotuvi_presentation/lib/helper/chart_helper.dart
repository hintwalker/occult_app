part of lasotuvi_presentation;

class ChartHelper {
  static void openChartCreationScreen(BuildContext context) {
    context.pushNamed(RouteName.chartCreation);
  }

  static void openChartDetail({
    required BuildContext context,
    required String chartId,
    required String? syncStatus,
  }) {
    showDialog(
        context: context,
        builder: (_) =>
            ChartDetailBody(chartId: chartId, syncStatus: syncStatus));
  }

  static void openChartView({
    required BuildContext context,
    // required WidgetRef ref,
    required Chart chart,
  }) {
    showDialog(
        context: context,
        builder: (context) => ChartViewBody(chart: chart),
        routeSettings: const RouteSettings(name: 'chartView'));
    // pageBuilder: (context, animation, secondaryAnimation) =>
    //     ChartViewBody(chart: chart),
    // routeSettings: const RouteSettings(name: 'chartView'));
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
      builder: (context) => ChartEditOptionsBody(
        chartId: chart.id,
        syncStatus: chart.syncStatus,
      ),
    );
  }

  static void openModifyChartNameModal({
    required BuildContext context,
    required int chartId,
    required String? syncStatus,
  }) {
    showDialog(
      context: context,
      builder: (context) => ModifyChartNameBody(
        chartId: chartId,
        syncStatus: syncStatus,
      ),
    );
  }

  static void openModifyBirthdayModal({
    required BuildContext context,
    required int chartId,
    required String? syncStatus,
  }) {
    showDialog(
      context: context,
      builder: (context) => ModifyBirthdayBody(
        chartId: chartId,
        syncStatus: syncStatus,
      ),
    );
  }

  static void openModifyGenderModal({
    required BuildContext context,
    required int chartId,
    required String? syncStatus,
  }) {
    showDialog(
      context: context,
      builder: (context) => ModifyGenderBody(
        chartId: chartId,
        syncStatus: syncStatus,
      ),
    );
  }

  static void openModifyAvatarModal({
    required BuildContext context,
    required int chartId,
    required String? syncStatus,
  }) {
    showDialog(
      context: context,
      builder: (context) => ModifyChartAvatarBody(
        chartId: chartId,
        syncStatus: syncStatus,
      ),
    );
  }

  static void openModifyWatchingYearModal({
    required BuildContext context,
    required int chartId,
    required String? syncStatus,
  }) {
    showDialog(
      context: context,
      builder: (context) => ModifyWatchingYearBody(
        chartId: chartId,
        syncStatus: syncStatus,
      ),
    );
  }
}
