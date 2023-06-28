part of lasotuvi_provider;

final onTagHasChartsProvider = Provider.autoDispose<OnTagHasCharts>(
    (ref) => OnTagHasCharts(repository: ref.read(chartTagRepositoryProvider)));
