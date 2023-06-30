part of lasotuvi_provider;

final onTagHasChartsListProvider = Provider.autoDispose<OnTagHasChartsList>(
    (ref) =>
        OnTagHasChartsList(repository: ref.read(chartTagRepositoryProvider)));
