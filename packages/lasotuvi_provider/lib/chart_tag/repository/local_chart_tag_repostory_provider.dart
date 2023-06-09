part of lasotuvi_provider;

final localChartTagRepositoryProvider =
    Provider.autoDispose<LocalChartTagRepositoryImpl>((ref) =>
        LocalChartTagRepositoryImpl(ref.read(sqliteChartTagDataSourceProvider),
            leftIdColumn: ColumnChartTag.chartId,
            rightIdColumn: ColumnChartTag.tagId,
            leftRepository: ref.read(localChartRepositoryProvider),
            rightRepository: ref.read(localTagRepositoryProvider)));
