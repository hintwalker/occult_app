part of tauari_ui;

class ListItemHasStorageIcon<T> extends StatelessWidget {
  const ListItemHasStorageIcon({
    super.key,
    this.uid,
    this.syncStatus,
    required this.syncData,
    required this.colorScheme,
    // this.storageOptionsModalBuilder,
    this.itemPadding = const EdgeInsets.only(top: 8.0),
    required this.child,
    this.onSyncStatusTap,
  });
  final String? uid;
  final T syncData;
  final String? syncStatus;
  final void Function()? onSyncStatusTap;
  // final Widget Function(T, {String? uid, String? onCloud})?
  //     storageOptionsModalBuilder;
  final ColorScheme colorScheme;
  final EdgeInsetsGeometry itemPadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: itemPadding,
          child: child,
        ),
        Positioned(
            child: SyncStatusRibbonWidget(
                uid: uid,
                syncStatus: syncStatus,
                colorScheme: colorScheme,
                onTap: () => onSyncStatusTap ?? ())
            // StorageIconButton(
            //   item: syncData,
            //   onCloud: onCloud,
            //   uid: uid,
            //   storageOptionsModalBuilder: storageOptionsModalBuilder,
            //   colorScheme: colorScheme,
            //   padding: const EdgeInsets.all(8.0),
            // ),
            )
      ],
    );
  }
}
