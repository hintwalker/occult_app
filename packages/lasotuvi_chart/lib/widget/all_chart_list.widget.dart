part of lasotuvi_chart;

class AllChartListWidget extends StatelessWidget {
  const AllChartListWidget(
    this.data, {
    super.key,
    required this.translate,
    required this.colorScheme,
    required this.onOpenTag,
    required this.onOpenNote,
    required this.onOpenMore,
    required this.onItemTap,
    required this.storageOptionsModalBuilder,
    this.slidable = true,
    this.uid,
  });
  final Iterable<ChartHasTags> data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext, Chart, String? uid) onOpenTag;
  final void Function(BuildContext, Chart, String? uid) onOpenNote;
  final void Function(BuildContext, Chart, String? uid) onOpenMore;
  final void Function(BuildContext, Chart, String? uid) onItemTap;
  final bool slidable;
  final String? uid;
  final Widget Function(Chart, {String? uid, String? onCloud})
      storageOptionsModalBuilder;

  SimpleTextGroup groupBy(ChartHasTags item) {
    final firstLetter = item.source.name.substring(0, 1);
    return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  }

  Iterable<ActionButton<ChartHasTags>> buttons() => [
        ActionButton<ChartHasTags>(
          onPressed: (context, item) => onOpenTag(context, item.source, uid),
          background: colorScheme.background,
          foreground: colorScheme.onBackground,
          icon: Icons.label_outline,
        ),
        ActionButton<ChartHasTags>(
          onPressed: (context, item) => onOpenNote(context, item.source, uid),
          background: colorScheme.background,
          foreground: colorScheme.onBackground,
          icon: Icons.sticky_note_2_outlined,
        ),
        ActionButton<ChartHasTags>(
          onPressed: (context, item) => onOpenMore(context, item.source, uid),
          background: colorScheme.background,
          foreground: colorScheme.onBackground,
          icon: Icons.more_vert,
        )
      ];

  bool whereTest(ChartHasTags item, String query) {
    return item.source.name.toLowerCase().contains(query.trim().toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return DataListView<ChartHasTags, SimpleTextGroup>(
      data,
      groupBy: groupBy,
      itemBuilder: (item) => ChartListItem(
        item,
        uid: uid,
        translate: translate,
        colorScheme: colorScheme,
        onTap: onItemTap,
        storageOptionsModalBuilder: storageOptionsModalBuilder,
      ),
      groupSeperatorBuilder: (p0) => Text(p0.label),
      buttons: buttons(),
      whereTest: whereTest,
      translate: translate,
      slidable: slidable,
    );
  }
}
