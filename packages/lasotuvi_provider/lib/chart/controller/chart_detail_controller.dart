part of lasotuvi_provider;

final chartDetailControllerProvider = Provider<ChartDetailController>(
  (ref) => ChartDetailController(
    onSyncableData: ref.read(onChartProvider),
  ),
);
