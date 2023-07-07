part of lasotuvi_provider;

final tagHasChartsListControllerProvider = ChangeNotifierProvider.autoDispose(
    (ref) => TagHasChartsListController(
        onData: ref.read(onTagHasChartsListProvider)));
