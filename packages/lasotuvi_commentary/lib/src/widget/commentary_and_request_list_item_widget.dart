import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

import 'commentary_item_content_widget.dart';
import 'commentary_item_divider_widget.dart';
import 'commentary_item_owner_widget.dart';
import 'commentary_title_widget.dart';

class CommentaryAndRequestListItemWidget extends StatelessWidget {
  const CommentaryAndRequestListItemWidget(
    this.item, {
    super.key,
    required this.uid,
    required this.colorScheme,
    required this.onSyncStatusTap,
    required this.onTap,
  });

  final CommentaryAndRequest item;
  final ColorScheme colorScheme;
  final String? uid;
  final void Function() onSyncStatusTap;
  final void Function(Commentary note) onTap;

  @override
  Widget build(BuildContext context) {
    return SyncableCardItemScaffold(
      padding: const EdgeInsets.only(right: 12.0),
      uid: uid,
      onlyCloudColor: colorScheme.outlineVariant,
      onlyLocalColor: colorScheme.outline,
      syncedColor: colorScheme.tertiary,
      // colorScheme: colorScheme,
      onItemTap: () => onTap(item.entity1!),
      syncStatus: item.entity1!.syncStatus,
      onSyncStatusTap: onSyncStatusTap,
      child: Container(
        padding: const EdgeInsets.only(top: 12.0, bottom: 2.0),
        // constraints:
        //     const BoxConstraints(minWidth: 64.0, maxWidth: 160.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommentaryTitleWidget(item.entity1!.title),
                  const CommentaryItemDividerWidget(),
                  CommentaryItemOwnerWidget(item.entity2!),
                  const CommentaryItemDividerWidget(),
                  CommentaryItemContentWidget(item.entity1!.content),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
