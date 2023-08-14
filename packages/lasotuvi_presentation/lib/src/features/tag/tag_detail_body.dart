import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart_shared/lasotuvi_chart_shared.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_presentation/src/helper/pop_to_parrent.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_tag/lasotuvi_tag.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_style/tuvi_style.dart';

import '../../router/route_name.dart';
import '../chart/navigation/chart_navigation.dart';
import '../../helper/storage_helper.dart';
import 'navigation/tag_navigation.dart';
import '../auth/user_auth_depended_state.dart';

class TagDetailBody extends ConsumerStatefulWidget {
  const TagDetailBody(
    this.tag, {
    super.key,
  });
  final Tag tag;

  @override
  ConsumerState<TagDetailBody> createState() => _TagDetailBodyState();
}

class _TagDetailBodyState extends UserAuthDependedState<TagDetailBody> {
  // @override
  // void dispose() {
  //   ref.invalidate(tagDetailControllerProvider);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const LoadingWidget()
        : TagDetailBuilder(
            uid: uid,
            tag: widget.tag,
            controller: ref.watch(tagDetailControllerProvider),
            colorScheme: lightColorScheme,
            translate: translate,
            child: (tagHasCharts) => TagDetailModal(
              uid: uid,
              syncStatus: tagHasCharts.source.syncStatus,
              title: translate('tag'),
              colorScheme: lightColorScheme,
              onSyncDataTap: (context) => StorageHelper.showOptionsModal<Tag>(
                tagHasCharts.source,
                context: context,
                uid: uid,
                ref: ref,
                callback: () => popToParrent(context, RouteName.tagDetail),
              ),
              child: TagDetailWidget(
                uid: uid,
                tagHasCharts: tagHasCharts,
                colorScheme: lightColorScheme,
                translate: translate,
                // onChartItemTap: (context, chart) =>
                //     ChartHelper.openChartView(context: context, chart: chart),
                onChangeInfoTap: (context, tag) =>
                    TagNavigation.openTagEdit(context, tag),
                // onOpenTagSyncOptions: (context, tag) =>
                //     StorageHelper.showOptionsModal<Tag>(
                //   tag,
                //   context: context,
                //   uid: uid,
                //   ref: ref,
                //   doBeforeDeleteForever: () =>
                //       popToParrent(context, RouteName.tagDetail),
                // ),
                // chartSyncOptions: (chart, {syncStatus, uid}) =>
                //     StorageHelper.storageOptionsModalBuilder<Chart>(chart,
                //         ref: ref),
                onOpenChartList: (context, tag) =>
                    ChartNavigation.openCheckboxChartList(context, tag),
                chartItem: (chart) => HoriChartItemWidget(
                  chart,
                  uid: uid,
                  colorScheme: lightColorScheme,
                  translate: translate,
                  onTap: (context, chart) => ChartNavigation.openChartView(
                    context: context,
                    chart: chart,
                    saveLastView: true,
                  ),
                  onSyncStatusTap: () => StorageHelper.showOptionsModal<Chart>(
                      chart,
                      uid: uid,
                      context: context,
                      ref: ref),
                ),
              ),
            ),
          );
  }
}
