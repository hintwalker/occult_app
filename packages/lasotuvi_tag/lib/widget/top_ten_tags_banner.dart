part of lasotuvi_tag;

class TopTenTagsBanner extends StatelessWidget {
  const TopTenTagsBanner({
    super.key,
    required this.uid,
    required this.controller,
    required this.translate,
    required this.colorScheme,
    required this.onAddData,
    required this.onShowAll,
    required this.onItemTap,
    required this.storageOptionsModalBuilder,
  });

  final String? uid;
  final SyncableDataListStreamController<Tag> controller;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function() onAddData;
  final void Function() onShowAll;
  final void Function(BuildContext context, Tag tag) onItemTap;
  final Widget Function(Tag, {String? uid, String? syncStatus})
      storageOptionsModalBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TopTenHeadlineWidget(translate(TuviStrings.tag),
              showAllText: translate(TuviStrings.showAll),
              colorScheme: colorScheme,
              onAddData: onAddData,
              onShowAll: onShowAll),
          Expanded(
              child: HorizontalDataListBuilder<Tag>(
                  uid: uid,
                  controller: controller,
                  itemWidget: (item) => HoriTagItemWidget(
                        item,
                        uid: uid,
                        onTap: onItemTap,
                        colorScheme: colorScheme,
                        onSyncStatusTap: () =>
                            openStorageOptions(context, item),
                      ),
                  queryArgs: QueryArgs(
                    uid: uid,
                    limit: 9,
                    orderBy: '$columnId DESC',
                  )))
        ],
      ),
    );
  }

  void openStorageOptions(BuildContext context, Tag item) {
    showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: storageOptionsModalBuilder(item,
                  syncStatus: item.syncStatus, uid: uid),
            ));
  }
}
