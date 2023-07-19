import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

import 'tag_item_card_widget.dart';

class TagListItemWidget extends StatelessWidget {
  const TagListItemWidget(
    this.data, {
    super.key,
    required this.colorScheme,
    required this.translate,
    this.onTap,
    this.uid,
    this.onSyncStatusTap,
  });

  final Tag data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext, Tag, String? uid)? onTap;
  final String? uid;
  final void Function()? onSyncStatusTap;
  // final Widget Function(Chart, {String? uid, String? onCloud})?
  //     storageOptionsModalBuilder;

  @override
  Widget build(BuildContext context) {
    return SyncableItemScaffold(
      uid: uid,
      // syncData: data,
      syncStatus: data.syncStatus,
      colorScheme: colorScheme,
      onSyncStatusTap: onSyncStatusTap,
      // storageOptionsModalBuilder: storageOptionsModalBuilder,
      child: TagItemCardWidget(
        data,
        uid: uid,
        colorScheme: colorScheme,
        translate: translate,
        onTap: onTap,
        // tags: const [],
      ),
    );
  }
}
