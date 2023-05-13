part of lasotuvi_provider;

final chartRepositoryProvider = Provider.autoDispose((ref) =>
    ChartRepositoryImpl(
        localRepository: ref.read(localChartRepositoryProvider),
        cloudRepository: ref.read(cloudChartRepositoryProvider)));
