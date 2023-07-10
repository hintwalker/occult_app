import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

import 'hori_tag_subtitle_widget.dart';
import 'hori_tag_title_widget.dart';

class HoriTagItemWidget extends StatelessWidget {
  const HoriTagItemWidget(
    this.item, {
    super.key,
    this.uid,
    required this.colorScheme,
    required this.onSyncStatusTap,
    required this.onTap,
  });

  final Tag item;
  final ColorScheme colorScheme;
  final String? uid;
  final void Function() onSyncStatusTap;
  final void Function(BuildContext context, Tag tag) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Stack(
        children: [
          InkWell(
            onTap: () => onTap(context, item),
            child: Card(
              margin: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 4.0),
              child: Container(
                padding: const EdgeInsets.only(top: 12.0, bottom: 2.0),
                constraints: const BoxConstraints(
                  minWidth: 84.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HoriTagTitleWidget(item.title),
                      HoriTagSubTitleWidget(item.subTitle)
                    ]),
              ),
            ),
          ),
          Positioned(
            child: SyncStatusRibbonWidget<Tag>(
              uid: uid,
              syncStatus: item.syncStatus,
              colorScheme: colorScheme,
              onTap: onSyncStatusTap,
            ),
          ),
        ],
      ),
    );
  }
}
