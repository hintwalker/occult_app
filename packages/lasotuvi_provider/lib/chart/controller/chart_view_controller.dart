part of lasotuvi_provider;

final chartViewControllerProvider = ChangeNotifierProvider<ChartViewController>(
  (ref) => ChartViewController(
    onData: ref.read(onChartHasTagsProvider),
    onNotes: ref.read(
      onNoteByChartIdProvider,
    ),
  ),
);
