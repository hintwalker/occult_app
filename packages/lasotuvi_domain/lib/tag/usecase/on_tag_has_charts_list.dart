part of lasotuvi_domain;

class OnTagHasChartsList
    extends OnSyncableRightHasLeftList<ChartTag, Chart, Tag, TagHasCharts> {
  OnTagHasChartsList({required super.repository})
      : super(
            onCreateItem: (tag, charts) =>
                TagHasCharts(source: tag, carry: charts));
}
