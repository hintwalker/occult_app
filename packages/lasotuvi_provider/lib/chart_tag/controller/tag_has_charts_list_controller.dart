part of lasotuvi_provider;

final tagHasChartsListControllerProvider = ChangeNotifierProvider((ref) =>
    TagHasChartsListController(onData: ref.read(onTagHasChartsListProvider)));
