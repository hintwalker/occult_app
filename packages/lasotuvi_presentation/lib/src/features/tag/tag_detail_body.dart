import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart_tag/lasotuvi_chart_tag.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_tag/lasotuvi_tag.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_style/tuvi_style.dart';

import '../../helper/chart_helper.dart';
import '../../helper/storage_helper.dart';
import '../../helper/tag_helper.dart';
import '../auth/auth_depended_state.dart';

class TagDetailBody extends ConsumerStatefulWidget {
  const TagDetailBody(
    this.tag, {
    super.key,
  });
  final Tag tag;

  @override
  ConsumerState<TagDetailBody> createState() => _TagDetailBodyState();
}

class _TagDetailBodyState extends AuthDependedState<TagDetailBody> {
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
              title: translate('tag'),
              colorScheme: lightColorScheme,
              child: TagDetailWidget(
                uid: uid,
                tagHasCharts: tagHasCharts,
                colorScheme: lightColorScheme,
                translate: translate,
                // onChartItemTap: (context, chart) =>
                //     ChartHelper.openChartView(context: context, chart: chart),
                onChangeInfoTap: (context, tag) =>
                    TagHelper.openTagEdit(context, tag),
                tagSyncOptions: (tag, {syncStatus, uid}) =>
                    StorageHelper.storageOptionsModalBuilder<Tag>(tag,
                        uid: uid, syncStatus: syncStatus, ref: ref),
                // chartSyncOptions: (chart, {syncStatus, uid}) =>
                //     StorageHelper.storageOptionsModalBuilder<Chart>(chart,
                //         ref: ref),
                onOpenChartList: (context, tag) =>
                    ChartHelper.openCheckboxChartList(context, tag),
                chartItem: (chart) => HoriChartItemWidget(
                  chart,
                  uid: uid,
                  colorScheme: lightColorScheme,
                  translate: translate,
                  onTap: (context, chart) =>
                      ChartHelper.openChartView(context: context, chart: chart),
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
