part of lasotuvi_provider;

final chartListControllerProvider = ChangeNotifierProvider<ChartListController>(
    (ref) => ChartListController(onCharts: ref.read(onChartsProvider)));
