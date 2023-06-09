part of lasotuvi_provider;

final cloudChartTagRepositoryProvider =
    Provider.autoDispose<CloudChartTagRepositoryImpl>(
  (ref) => CloudChartTagRepositoryImpl(
      ref.read(firebaseChartTagDataSourceProvider),
      leftIdColumn: ColumnChartTag.chartId,
      rightIdColumn: ColumnChartTag.tagId,
      leftRepository: ref.read(cloudChartRepositoryProvider),
      rightRepository: ref.read(cloudTagRepositoryProvider)),
);
