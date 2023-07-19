import 'package:flutter/material.dart';
import 'package:tauari_values/tauari_values.dart';

class SyncStatusRibbonWidget extends StatelessWidget {
  const SyncStatusRibbonWidget({
    super.key,
    this.uid,
    this.syncStatus,
    required this.colorScheme,
    required this.onTap,
    // required this.storageOptionsModalBuilder,
  });

  final String? syncStatus;
  final String? uid;
  final ColorScheme colorScheme;
  final void Function() onTap;
  // final Widget Function(T, {String? uid, String? syncStatus})
  //     storageOptionsModalBuilder;

  Icon getIcon(String? uid, String? syncStatus) {
    if (uid == null) {
      return Icon(
        Icons.cloud_off,
        color: colorScheme.outline,
      );
    }
    if (syncStatus == SyncStatus.synced) {
      return Icon(
        Icons.cloud_done,
        color: colorScheme.tertiary,
      );
    } else if (syncStatus == SyncStatus.onlyCloud) {
      return Icon(
        Icons.cloud_outlined,
        color: colorScheme.outlineVariant,
      );
    }
    return Icon(
      Icons.cloud_off,
      color: colorScheme.outline,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            // shape: const CircleBorder(),
            visualDensity: VisualDensity.standard,
            padding: const EdgeInsets.all(2.0),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: getIcon(uid, syncStatus)));
  }
}
