part of lasotuvi_provider;

final chartDetailControllerProvider =
    ChangeNotifierProvider.autoDispose<ChartDetailController>(
  (ref) => ChartDetailController(
    onSyncableData: ref.read(onChartProvider),
  ),
);
