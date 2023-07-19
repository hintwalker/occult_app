import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

import 'commentary_item_content_widget.dart';
import 'commentary_item_divider_widget.dart';
import 'commentary_title_widget.dart';

class CommentaryItemWidget extends StatelessWidget {
  const CommentaryItemWidget(
    this.item, {
    super.key,
    this.uid,
    required this.colorScheme,
    required this.onSyncStatusTap,
    required this.onTap,
  });

  final Commentary item;
  final ColorScheme colorScheme;
  final String? uid;
  final void Function() onSyncStatusTap;
  final void Function(BuildContext context, Commentary commentary) onTap;

  @override
  Widget build(BuildContext context) {
    return SyncableCardItemScaffold(
      padding: const EdgeInsets.only(right: 12.0),
      uid: uid,
      colorScheme: colorScheme,
      onItemTap: () => onTap(context, item),
      syncStatus: item.syncStatus,
      onSyncStatusTap: onSyncStatusTap,
      child: Container(
        padding: const EdgeInsets.only(top: 12.0, bottom: 2.0),
        constraints: const BoxConstraints(minWidth: 64.0, maxWidth: 160.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CommentaryTitleWidget(item.title),
              const CommentaryItemDividerWidget(),
              CommentaryItemContentWidget(item.content),
            ]),
      ),
    );
    // Padding(
    //     padding: const EdgeInsets.only(right: 12.0),
    //     child: Stack(children: [
    //       Card(
    //         margin: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 4.0),
    //         child: InkWell(
    //           onTap: () => onTap(context, item),
    //           borderRadius: BorderRadius.circular(12.0),
    //           child: Container(
    //             padding: const EdgeInsets.only(top: 12.0, bottom: 2.0),
    //             constraints:
    //                 const BoxConstraints(minWidth: 64.0, maxWidth: 160.0),
    //             child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   CommentaryTitleWidget(item.title),
    //                   const CommentaryItemDividerWidget(),
    //                   CommentaryItemContentWidget(item.content),
    //                 ]),
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //           child: SyncStatusRibbonWidget(
    //         uid: uid,
    //         syncStatus: item.syncStatus,
    //         colorScheme: colorScheme,
    //         onTap: onSyncStatusTap,
    //       ))
    //     ]));
  }
}
