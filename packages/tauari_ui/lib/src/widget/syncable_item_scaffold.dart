import 'package:flutter/material.dart';
import 'sync_status_ribbon_widget.dart';

class SyncableItemScaffold extends StatelessWidget {
  const SyncableItemScaffold({
    super.key,
    required this.uid,
    required this.syncStatus,
    // required this.syncData,
    required this.colorScheme,
    // this.storageOptionsModalBuilder,
    this.padding = const EdgeInsets.only(),
    required this.child,
    required this.onSyncStatusTap,
    // required this.onItemTap,
  });
  final String? uid;
  // final T syncData;
  final String? syncStatus;
  final void Function()? onSyncStatusTap;
  // final Widget Function(T, {String? uid, String? onCloud})?
  //     storageOptionsModalBuilder;
  final ColorScheme colorScheme;
  final EdgeInsetsGeometry padding;
  // final void Function() onItemTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: padding,
          child: child,
        ),
        Positioned(
            child: SyncStatusRibbonWidget(
                uid: uid,
                syncStatus: syncStatus,
                colorScheme: colorScheme,
                onTap: () {
                  if (onSyncStatusTap != null) {
                    onSyncStatusTap!();
                  }
                })
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
