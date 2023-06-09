part of lasotuvi_provider;

final uploadChartProvider = Provider.autoDispose<UploadChart>(
    (ref) => UploadChart(ref.read(chartRepositoryProvider)));
