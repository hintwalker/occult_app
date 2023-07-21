import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

import 'request_item_content_widget.dart';

class RequestListItemWidget extends StatelessWidget {
  const RequestListItemWidget(
    this.data, {
    super.key,
    required this.colorScheme,
    required this.translate,
    this.onTap,
    this.uid,
    this.onSyncStatusTap,
  });

  final Request data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(Request)? onTap;
  final String? uid;
  final void Function()? onSyncStatusTap;
  // final Widget Function(Request, {String? uid, String? onCloud})?
  //     storageOptionsModalBuilder;

  @override
  Widget build(BuildContext context) {
    return SyncableCardItemScaffold(
      uid: uid,
      // syncData: data,
      syncStatus: data.syncStatus,
      colorScheme: colorScheme,
      onSyncStatusTap: onSyncStatusTap,
      // storageOptionsModalBuilder: storageOptionsModalBuilder,
      onItemTap: () {
        if (onTap != null) {
          onTap!(data);
        }
      },
      child: RequestItemContentWidget(
        data,
        uid: uid,
        colorScheme: colorScheme,
        translate: translate,
        onTap: onTap,
        tags: const [],
      ),
    );
  }
}
