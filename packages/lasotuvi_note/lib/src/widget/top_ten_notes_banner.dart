import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_note_shared/lasotuvi_note_shared.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_strings/tuvi_strings.dart';

import '../controller/note_and_chart_list_controller.dart';

class TopTenNotesBanner extends StatelessWidget {
  const TopTenNotesBanner({
    super.key,
    required this.uid,
    required this.controller,
    required this.translate,
    required this.colorScheme,
    required this.onAddData,
    required this.onShowAll,
    required this.onItemTap,
    required this.onOpenSyncOptions,
    required this.countController,
    required this.countOnCloudController,
  });
  final String? uid;
  final NoteAndChartListController controller;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function() onAddData;
  final void Function() onShowAll;
  final void Function(Note note) onItemTap;
  final void Function(Note note) onOpenSyncOptions;
  final CountNoteEveryWhereController countController;
  final CountNoteOnCloudController countOnCloudController;
  // final Widget Function(Note, {String? uid, String? syncStatus})
  //     storageOptionsModalBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          TopTenHeadlineWidget(
            translate(TuviStrings.note),
            uid: uid,
            showAllText: translate(TuviStrings.showAll),
            colorScheme: colorScheme,
            onAddData: onAddData,
            onShowAll: onShowAll,
            dataCount: DataCountWidget(
              uid: uid,
              controller: countController,
              colorScheme: colorScheme,
              cloudController: countOnCloudController,
            ),
          ),
          // Expanded(
          //     child:
          PairDataGridBuilder<Note, Chart, NoteAndChart>(
            uid: uid,
            controller: controller,
            itemWidget: (item) => NoteAndChartItemWidget(
              item,
              uid: uid,
              colorScheme: colorScheme,
              onSyncStatusTap: () => onOpenSyncOptions(item.entity1!),
              onTap: onItemTap,
            ),
            queryArgs: QueryArgs(
              uid: uid,
              limitDisplay: 10,
              orderBy: '${ColumnNote.edited} DESC',
            ),
            emptyDataText: Text(
              translate('emptyNote'),
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.outline,
              ),
            ),
          ),
          // )
        ]));
  }

  // void openStorageOptions(BuildContext context, Note? item) {
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
