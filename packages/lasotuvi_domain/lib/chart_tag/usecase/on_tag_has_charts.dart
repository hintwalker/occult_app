part of lasotuvi_domain;

class OnTagHasCharts
    extends OnSyncableRightHasLeft<ChartTag, Chart, Tag, TagHasCharts> {
  OnTagHasCharts({required super.repository})
      : super(
            onCreateItem: (chart, tags) =>
                TagHasCharts(source: chart, carry: tags));
}
