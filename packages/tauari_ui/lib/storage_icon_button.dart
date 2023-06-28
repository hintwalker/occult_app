part of tauari_ui;

class StorageIconButton<T> extends StatelessWidget {
  const StorageIconButton(
      {super.key,
      this.uid,
      this.onCloud,
      required this.item,
      this.storageOptionsModalBuilder,
      required this.colorScheme,
      this.padding = const EdgeInsets.all(4.0)});
  final String? onCloud;
  final String? uid;
  final T item;
  final ColorScheme colorScheme;
  final EdgeInsetsGeometry padding;
  final Widget Function(T, {String? uid, String? onCloud})?
      storageOptionsModalBuilder;

  Icon getIcon(String? uid, String? onCloud) {
    if (uid == null) {
      return Icon(
        Icons.offline_pin_outlined,
        color: colorScheme.outline,
      );
    }
    if (onCloud == SyncStatus.synced) {
      return Icon(
        Icons.cloud_done,
        color: colorScheme.tertiary,
      );
    } else if (onCloud == SyncStatus.onlyCloud) {
      return Icon(
        Icons.file_download_outlined,
        color: colorScheme.outline,
      );
    }
    return Icon(
      Icons.cloud_upload_outlined,
      color: colorScheme.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: storageOptionsModalBuilder == null
            ? null
            : () => showModalBottomSheet(
                context: context,
                builder: (ctx) => storageOptionsModalBuilder!(
                      item,
                      uid: uid,
                      onCloud: onCloud,
                    )),
        style: ElevatedButton.styleFrom(
            // shape: const CircleBorder(),
            visualDensity: VisualDensity.standard,
            padding: padding,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        child: getIcon(uid, onCloud));
  }
}
