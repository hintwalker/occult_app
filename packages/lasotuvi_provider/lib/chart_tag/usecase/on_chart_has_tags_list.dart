part of lasotuvi_provider;

final onChartHasTagsListProvider = Provider.autoDispose<OnChartHasTagsList>(
    (ref) =>
        OnChartHasTagsList(repository: ref.read(chartTagRepositoryProvider)));
