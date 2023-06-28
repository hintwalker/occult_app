part of lasotuvi_domain;

class OnChartHasTags
    extends OnSyncableLeftHasRight<ChartTag, Chart, Tag, ChartHasTags> {
  OnChartHasTags({required super.repository})
      : super(
            onCreateItem: (chart, tags) =>
                ChartHasTags(source: chart, carry: tags));
}
