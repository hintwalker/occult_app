part of lasotuvi_note;

class NoteAndChartItemWidget extends StatelessWidget {
  const NoteAndChartItemWidget(
    this.item, {
    super.key,
    this.uid,
    required this.colorScheme,
    required this.onSyncStatusTap,
  });

  final NoteAndChart item;
  final ColorScheme colorScheme;
  final String? uid;
  final void Function() onSyncStatusTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Stack(children: [
          Card(
              margin: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 4.0),
              child: Container(
                padding: const EdgeInsets.only(top: 12.0, bottom: 2.0),
                constraints:
                    const BoxConstraints(minWidth: 64.0, maxWidth: 160.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NoteTitleWidget(item.entity1!.title),
                      const NoteItemDividerWidget(),
                      NoteItemOwnerWidget(item.entity2!),
                      const NoteItemDividerWidget(),
                      NoteItemContentWidget(item.entity1!.content),
                    ]),
              )),
          Positioned(
              child: SyncStatusRibbonWidget<Note>(
            uid: uid,
            syncStatus: item.entity1!.syncStatus,
            colorScheme: colorScheme,
            onTap: onSyncStatusTap,
          ))
        ]));
  }
}
