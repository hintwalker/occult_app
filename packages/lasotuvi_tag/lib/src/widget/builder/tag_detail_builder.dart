import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../controller/tag_detail_controller.dart';

class TagDetailBuilder extends StatelessWidget {
  const TagDetailBuilder({
    super.key,
    required this.uid,
    required this.tag,
    required this.controller,
    required this.colorScheme,
    required this.translate,
    required this.child,
    // required this.tagSyncOptions,
    // required this.onChangeInfoTap,
    // required this.onOpenChartList,
    // required this.chartItem,
  });
  final TagDetailController controller;
  final String? uid;
  final Tag tag;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final Widget Function(TagHasCharts tag) child;
  // final Widget Function(Tag, {String? uid, String? syncStatus}) tagSyncOptions;
  // final void Function(BuildContext, Tag tag) onChangeInfoTap;
  // final void Function(BuildContext context, Tag tag) onOpenChartList;
  // final Widget Function(Chart chart) chartItem;

  @override
  Widget build(BuildContext context) {
    return BasicStreamBuilder(
      stream: controller.stream(uid, tag),
      loadingWidget: BasicLoadingModal(colorScheme: colorScheme),
      child: (tagHasCharts) => tagHasCharts == null
          ? BasicErrorModal(
              colorScheme: colorScheme,
            )
          : child(tagHasCharts),
      // {

      //   if (snapshot.connectionState == ConnectionState.waiting) {
      //     return const LoadingWidget();
      //   } else if (snapshot.hasData) {
      //     final tag = snapshot.requireData;
      //     return tag == null ? const ErrorTextWidget() : child(tag);
      //     // TagDetailWidget(
      //     //     uid: uid,
      //     //     tagHasCharts: tag,
      //     //     colorScheme: colorScheme,
      //     //     translate: translate,
      //     //     // onChartItemTap: onChartItemTap,
      //     //     tagSyncOptions: tagSyncOptions,
      //     //     // chartSyncOptions: chartSyncOptions,
      //     //     onChangeInfoTap: onChangeInfoTap,
      //     //     onOpenChartList: onOpenChartList,
      //     //     chartItem: chartItem,
      //     //   );
      //   } else {
      //     return const ErrorTextWidget();
      //   }
      // },
    );
  }
}
