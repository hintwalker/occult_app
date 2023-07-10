import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../controller/chart_has_tags_list_controller.dart';

class AllChartListBuilder extends StatelessWidget {
  const AllChartListBuilder({
    super.key,
    required this.uid,
    required this.controller,
    required this.child,

    // required this.translate,
    // required this.colorScheme,
    // required this.onOpenTag,
    // required this.onOpenNote,
    // required this.onOpenMore,
    // required this.onItemTap,
    // required this.storageOptionsModalBuilder,
  });

  final ChartHasTagsListController controller;
  final String? uid;
  final Widget Function(Iterable<ChartHasTags> chartHasTags) child;

  // final String Function(String) translate;
  // final ColorScheme colorScheme;
  // final void Function(BuildContext, Chart, String? uid) onOpenTag;
  // final void Function(BuildContext, Chart, String? uid) onOpenNote;
  // final void Function(BuildContext, Chart, String? uid) onOpenMore;
  // final void Function(BuildContext, Chart, String? uid) onItemTap;
  // final Widget Function(Chart, {String? uid, String? syncStatus})
  //     storageOptionsModalBuilder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.stream(uid, QueryArgs(uid: uid)),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return child(snapshot.requireData);
            // return AllChartListWidget(snapshot.requireData,
            //     translate: translate,
            //     colorScheme: colorScheme,
            //     onOpenTag: onOpenTag,
            //     onOpenNote: onOpenNote,
            //     onOpenMore: onOpenMore,
            //     onItemTap: onItemTap,
            //     storageOptionsModalBuilder: storageOptionsModalBuilder);
          } else {
            return const Center(
              child: ErrorTextWidget(),
            );
          }
        });
  }
}
