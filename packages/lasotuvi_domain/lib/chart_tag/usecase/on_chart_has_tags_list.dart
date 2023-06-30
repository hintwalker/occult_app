part of lasotuvi_domain;

class OnChartHasTagsList
    extends OnSyncableLeftHasRightList<ChartTag, Chart, Tag, ChartHasTags> {
  OnChartHasTagsList({required super.repository})
      : super(
            onCreateItem: (chart, tags) =>
                ChartHasTags(source: chart, carry: tags));
}
