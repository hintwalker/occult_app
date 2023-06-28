part of lasotuvi_chart;

class CheckBoxChartListWidget extends StatelessWidget {
  const CheckBoxChartListWidget(
    this.data, {
    super.key,
    this.uid,
    required this.tagId,
    required this.translate,
    required this.colorScheme,
    required this.onItemTap,
    required this.onSubmit,
    required this.onCancel,
  });
  final int tagId;
  final Iterable<ChartHasTags> data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final String? uid;
  final void Function(BuildContext context,
      Iterable<SelectableItem<ChartHasTags>> charts, String? uid) onSubmit;
  final void Function(BuildContext context) onCancel;
  final void Function(BuildContext context, Chart chart, String? uid) onItemTap;

  @override
  Widget build(BuildContext context) {
    return SelectableDataListView<ChartHasTags, SimpleTextGroup>(
      data,
      groupBy: groupBy,
      itemBuilder: (item) => ChartListItemWidget(
        item.source,
        uid: uid,
        translate: translate,
        colorScheme: colorScheme,
        onTap: onItemTap,
      ),
      groupSeperatorBuilder: (p0) => Text(p0.label),
      whereTest: whereTest,
      translate: translate,
      onCancel: onCancel,
      onSubmit: (context, charts) => onSubmit(context, charts, uid),
      initSelected: (chartHasTags) => chartHasTags.carry
          .where(
            (element) => element.id == tagId,
          )
          .isNotEmpty,
      itemId: (chartHasTags) => chartHasTags.source.id,
    );
  }

  SimpleTextGroup groupBy(ChartHasTags item) {
    final firstLetter = item.source.name.substring(0, 1);
    return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  }

  bool whereTest(ChartHasTags item, String query) {
    return item.source.name.toLowerCase().contains(query.trim().toLowerCase());
  }
}
