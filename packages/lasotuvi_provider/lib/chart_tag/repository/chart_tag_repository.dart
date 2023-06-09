part of lasotuvi_provider;

final chartTagRepositoryProvider = Provider.autoDispose<ChartTagRepositoryImpl>(
  (ref) => ChartTagRepositoryImpl(
      localRelRepository: ref.read(localChartTagRepositoryProvider),
      cloudRelRepository: ref.read(cloudChartTagRepositoryProvider),
      leftRepository: ref.read(chartRepositoryProvider),
      rightRepository: ref.read(tagRepositoryProvider)),
);
