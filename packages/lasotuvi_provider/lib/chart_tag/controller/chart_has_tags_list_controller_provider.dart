part of lasotuvi_provider;

final chartHasTagsListControllerProvider = ChangeNotifierProvider.autoDispose(
    (ref) => ChartHasTagsListController(
        onData: ref.read(onChartHasTagsListProvider)));
