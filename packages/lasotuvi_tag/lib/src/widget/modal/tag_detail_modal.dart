import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class TagDetailModal extends StatelessWidget {
  const TagDetailModal({
    super.key,
    required this.title,
    required this.colorScheme,
    required this.onSyncDataTap,
    required this.syncStatus,
    required this.uid,
    required this.child,
  });
  final String title;
  final ColorScheme colorScheme;
  final String? uid;
  final String? syncStatus;
  final Widget child;
  final void Function(BuildContext context) onSyncDataTap;

  @override
  Widget build(BuildContext context) {
    return BasicModal(
      title: title,
      colorScheme: colorScheme,
      actions: [
        SyncStatusRibbonWidget(
          uid: uid,
          syncStatus: syncStatus,
          // colorScheme: colorScheme,
          onTap: () => onSyncDataTap(context),
        ),
      ],
      child: child,
    );
  }
}
