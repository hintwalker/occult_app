part of lasotuvi_chart;

class CheckBoxChartListWidget extends StatelessWidget {
  const CheckBoxChartListWidget(
    this.data, {
    super.key,
    required this.translate,
    required this.colorScheme,
    // required this.onItemTap,
    this.uid,
    required this.onSubmit,
    required this.onCancel,
  });
  final Iterable<Chart> data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final String? uid;
  final void Function(BuildContext context, Iterable<Chart> charts, String? uid)
      onSubmit;
  final void Function(BuildContext context) onCancel;
  // final void Function(BuildContext, Chart, String? uid) onItemTap;

  @override
  Widget build(BuildContext context) {
    return SelectableDataListView<Chart, SimpleTextGroup>(
      data,
      groupBy: groupBy,
      itemBuilder: (item) => ChartListItemWidget(
        item,
        uid: uid,
        translate: translate,
        colorScheme: colorScheme,
        onTap: null,
      ),
      groupSeperatorBuilder: (p0) => Text(p0.label),
      whereTest: whereTest,
      translate: translate,
      onCancel: onCancel,
      onSubmit: (context, charts) => onSubmit(context, charts, uid),
    );
  }

  SimpleTextGroup groupBy(Chart item) {
    final firstLetter = item.name.substring(0, 1);
    return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  }

  bool whereTest(Chart item, String query) {
    return item.name.toLowerCase().contains(query.trim().toLowerCase());
  }
}
