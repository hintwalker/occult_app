import 'package:flutter/material.dart';
import 'package:lasotuvi_commentary_shared/lasotuvi_commentary_shared.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_strings/tuvi_strings.dart';

import '../controller/commentary_and_request_list_controller.dart';
import 'commentary_and_request_list_item_widget.dart';

class TopTenCommentaryBanner extends StatelessWidget {
  const TopTenCommentaryBanner({
    super.key,
    required this.uid,
    required this.controller,
    required this.translate,
    required this.colorScheme,
    // required this.onAddData,
    required this.onShowAll,
    required this.onItemTap,
    required this.onOpenSyncOptions,
    required this.countController,
  });
  final String? uid;
  final CommentaryAndRequestListController controller;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  // final void Function() onAddData;
  final void Function() onShowAll;
  final void Function(Commentary commentary) onItemTap;
  final void Function(Commentary commentary) onOpenSyncOptions;
  final CountCommentaryEveryWhereController countController;
  // final OnCountCommentary onCommentaryCount;
  // final Widget Function(Commentary, {String? uid, String? syncStatus})
  //     storageOptionsModalBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          TopTenHeadlineWidget(
            translate(TuviStrings.commentary),
            uid: uid,
            showAllText: translate(TuviStrings.showAll),
            colorScheme: colorScheme,
            onAddData: null,
            onShowAll: onShowAll,
            dataCount: DataCountWidget(
              uid: uid,
              controller: countController,
            ),
          ),
          // Expanded(
          //     child:
          PairDataGridBuilder<Commentary, Request, CommentaryAndRequest>(
            uid: uid,
            controller: controller,
            itemWidget: (item) => CommentaryAndRequestListItemWidget(
              item,
              uid: uid,
              colorScheme: colorScheme,
              onSyncStatusTap: () => onOpenSyncOptions(item.entity1!),
              onTap: onItemTap,
            ),
            queryArgs: QueryArgs(
              uid: uid,
              limit: 9,
              orderBy: '${ColumnCommentary.lastViewed} DESC',
            ),
          ),
          // )
        ]));
  }

  // void openStorageOptions(BuildContext context, Commentary? item) {
  //   if (item == null) {
  //     return;
  //   }
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) => SingleChildScrollView(
  //             child: storageOptionsModalBuilder(item,
  //                 syncStatus: item.syncStatus, uid: uid),
  //           ));
  // }
}
