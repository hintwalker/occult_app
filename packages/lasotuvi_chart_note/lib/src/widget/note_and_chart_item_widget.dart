import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

import 'note_item_content_widget.dart';
import 'note_item_divider_widget.dart';
import 'note_item_owner_widget.dart';
import 'note_title_widget.dart';

class NoteAndChartItemWidget extends StatelessWidget {
  const NoteAndChartItemWidget(
    this.item, {
    super.key,
    this.uid,
    required this.colorScheme,
    required this.onSyncStatusTap,
    required this.onTap,
  });

  final NoteAndChart item;
  final ColorScheme colorScheme;
  final String? uid;
  final void Function() onSyncStatusTap;
  final void Function(Note note) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Stack(children: [
          Center(
            child: Card(
              margin: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 4.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(12.0),
                onTap: () => onTap(item.entity1!),
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
                            NoteTitleWidget(item.entity1!.title),
                            const NoteItemDividerWidget(),
                            NoteItemOwnerWidget(item.entity2!),
                            const NoteItemDividerWidget(),
                            NoteItemContentWidget(item.entity1!.content),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              child: SyncStatusRibbonWidget<Note>(
            uid: uid,
            syncStatus: item.entity1!.syncStatus,
            colorScheme: colorScheme,
            onTap: onSyncStatusTap,
          ))
        ]));
  }
}
