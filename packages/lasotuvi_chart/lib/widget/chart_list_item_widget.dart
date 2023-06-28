part of lasotuvi_chart;

class ChartListItemWidget extends StatelessWidget {
  const ChartListItemWidget(
    this.data, {
    super.key,
    required this.colorScheme,
    required this.translate,
    this.onTap,
    this.uid,
    this.onSyncStatusTap,
  });

  final Chart data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext, Chart, String? uid)? onTap;
  final String? uid;
  final void Function()? onSyncStatusTap;
  // final Widget Function(Chart, {String? uid, String? onCloud})?
  //     storageOptionsModalBuilder;

  @override
  Widget build(BuildContext context) {
    return ListItemHasStorageIcon<Chart>(
        uid: uid,
        syncData: data,
        syncStatus: data.syncStatus,
        colorScheme: colorScheme,
        onSyncStatusTap: onSyncStatusTap,
        // storageOptionsModalBuilder: storageOptionsModalBuilder,
        child: ChartItemCardWidget(data,
            uid: uid,
            colorScheme: colorScheme,
            translate: translate,
            onTap: onTap,
            tags: const []));
  }
}
