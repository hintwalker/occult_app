part of lasotuvi_provider;

final cloudChartRepositoryProvider = Provider.autoDispose<CloudChartRepository>(
    (ref) =>
        CloudChartRepositoryImpl(ref.read(firebaseChartDataSourceProvider)));
