part of lasotuvi_provider;

final chartHasTagsListControllerProvider = ChangeNotifierProvider((ref) =>
    ChartHasTagsListController(onData: ref.read(onChartHasTagsListProvider)));
