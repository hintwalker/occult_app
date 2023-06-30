part of lasotuvi_tag;

class CheckBoxTagListWidget extends StatelessWidget {
  const CheckBoxTagListWidget(
    this.data, {
    super.key,
    this.uid,
    required this.chartId,
    required this.translate,
    required this.colorScheme,
    required this.onItemTap,
    required this.onSubmit,
    required this.onCancel,
  });
  final int chartId;
  final Iterable<TagHasCharts> data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final String? uid;
  final void Function(BuildContext context,
      Iterable<SelectableItem<TagHasCharts>> tags, String? uid) onSubmit;
  final void Function(BuildContext context) onCancel;
  final void Function(BuildContext context, Tag tag, String? uid) onItemTap;

  @override
  Widget build(BuildContext context) {
    return SelectableDataListView<TagHasCharts, SimpleTextGroup>(
      data,
      groupBy: groupBy,
      groupComparator: groupComparator,
      itemBuilder: (item) => TagListItemWidget(
        item.source,
        uid: uid,
        translate: translate,
        colorScheme: colorScheme,
        onTap: onItemTap,
      ),
      groupSeperatorBuilder: (p0) => Text(p0.label),
      whereTest: whereTest,
      colorScheme: colorScheme,
      translate: translate,
      onCancel: onCancel,
      onSubmit: (context, charts) => onSubmit(context, charts, uid),
      initSelected: (tagHasCharts) => tagHasCharts.carry
          .where(
            (element) => element.id == chartId,
          )
          .isNotEmpty,
      itemId: (tagHasCharts) => tagHasCharts.source.id,
      sort: true,
    );
  }

  SimpleTextGroup groupBy(TagHasCharts item) {
    final firstLetter = item.source.title.substring(0, 1);
    return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  }

  int groupComparator(SimpleTextGroup item1, SimpleTextGroup item2) {
    return item1.label.compareTo(item2.label);
  }

  bool whereTest(TagHasCharts item, String query) {
    return item.source.title.toLowerCase().contains(query.trim().toLowerCase());
  }
}
