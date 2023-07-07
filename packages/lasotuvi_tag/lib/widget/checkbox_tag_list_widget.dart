part of lasotuvi_tag;

class CheckBoxTagListWidget extends StatelessWidget {
  const CheckBoxTagListWidget(
    this.data, {
    super.key,
    required this.uid,
    required this.chartId,
    required this.translate,
    required this.colorScheme,
    required this.onItemTap,
    required this.onSubmit,
    required this.onCancel,
    required this.onOpenTagCreation,
    required this.openSyncOptions,
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
  final void Function(BuildContext context) onOpenTagCreation;
  final void Function(String? uid, Tag tag) openSyncOptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () => onOpenTagCreation(context),
          icon: const Icon(Icons.add),
          label: Text(
            translate('createTag'),
          ),
        ),
        Expanded(
          child: SelectableDataListView<TagHasCharts, SimpleTextGroup>(
            data,
            groupBy: groupBy,
            groupComparator: groupComparator,
            itemBuilder: (item) => TagListItemWidget(
              item.source,
              uid: uid,
              translate: translate,
              colorScheme: colorScheme,
              onTap: onItemTap,
              onSyncStatusTap: () => openSyncOptions(
                uid,
                item.source,
              ),
            ),
            groupSeperatorBuilder: (p0) => BasicGroupSeperatorWidget(
              p0,
              colorScheme: colorScheme,
            ),
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
          ),
        ),
      ],
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
