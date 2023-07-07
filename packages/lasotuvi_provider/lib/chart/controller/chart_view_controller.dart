part of lasotuvi_provider;

final chartViewControllerProvider =
    ChangeNotifierProvider.autoDispose<ChartViewController>(
  (ref) => ChartViewController(
    onData: ref.read(onChartHasTagsProvider),
    onNotes: ref.read(
      onNoteByChartIdProvider,
    ),
  ),
);
