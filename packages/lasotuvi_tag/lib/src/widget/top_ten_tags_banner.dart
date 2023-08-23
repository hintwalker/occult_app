import 'package:flutter/material.dart';
import 'package:lasotuvi_tag_shared/lasotuvi_tag_shared.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_strings/tuvi_strings.dart';

class TopTenTagsBanner extends StatelessWidget {
  const TopTenTagsBanner({
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
  final SyncableDataListStreamController<Tag> controller;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function() onAddData;
  final void Function() onShowAll;
  final void Function(BuildContext context, Tag tag) onItemTap;
  final void Function(Tag tag) onOpenSyncOptions;
  final CountEveryWhereController countController;
  final CountOnCloudController countOnCloudController;
  // final Widget Function(Tag, {String? uid, String? syncStatus})
  //     storageOptionsModalBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TopTenHeadlineWidget(
            translate(TuviStrings.tag),
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
            // countEveryWhereController: countEveryWhereController,
          ),
          Expanded(
            child: HorizontalDataListBuilder<Tag>(
              uid: uid,
              controller: controller,
              itemWidget: (item) => HoriTagItemWidget(
                item,
                uid: uid,
                onTap: onItemTap,
                colorScheme: colorScheme,
                onSyncStatusTap: () => onOpenSyncOptions(item),
              ),
              queryArgs: QueryArgs(
                uid: uid,
                limitDisplay: 10,
                orderBy: '$columnId DESC',
              ),
              emptyDataText: Text(
                translate('emptyTag'),
                style: TextStyle(
                  fontSize: 14,
                  color: colorScheme.outline,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // void openStorageOptions(BuildContext context, Tag item) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) => SingleChildScrollView(
  //             child: storageOptionsModalBuilder(item,
  //                 syncStatus: item.syncStatus, uid: uid),
  //           ));
  // }
}
