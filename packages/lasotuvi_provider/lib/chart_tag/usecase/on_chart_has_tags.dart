part of lasotuvi_provider;

final onChartHasTagsProvider = Provider.autoDispose<OnChartHasTags>(
    (ref) => OnChartHasTags(repository: ref.read(chartTagRepositoryProvider)));
