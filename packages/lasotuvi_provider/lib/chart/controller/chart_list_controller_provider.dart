part of lasotuvi_provider;

final chartListControllerProvider =
    ChangeNotifierProvider.autoDispose<ChartListController>(
        (ref) => ChartListController(onCharts: ref.read(onChartsProvider)));
