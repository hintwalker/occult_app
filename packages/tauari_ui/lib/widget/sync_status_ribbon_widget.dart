part of tauari_ui;

class SyncStatusRibbonWidget extends StatelessWidget {
  const SyncStatusRibbonWidget(
      {super.key, this.uid, this.syncStatus, required this.colorScheme});

  final String? syncStatus;
  final String? uid;
  final ColorScheme colorScheme;

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
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            // shape: const CircleBorder(),
            visualDensity: VisualDensity.standard,
            padding: const EdgeInsets.all(2.0),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        child: getIcon(uid, syncStatus));
  }
}
