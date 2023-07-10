import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_list_view/tauari_list_view.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../../helper/chart_helper.dart';
import '../../auth/auth_depended_state.dart';

class CheckboxChartListBody extends ConsumerStatefulWidget {
  const CheckboxChartListBody(
    this.tag, {
    super.key,
    // required this.onSubmit,
  });
  final Tag tag;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CheckBoxChartListBodyState();

  // final void Function(BuildContext context, Iterable<Chart> charts, String? uid)
  //     onSubmit;
}

class _CheckBoxChartListBodyState
    extends AuthDependedState<CheckboxChartListBody> {
  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const LoadingWidget()
        : CheckboxChartListModal(
            controller: ref.watch(chartHasTagsListControllerProvider),
            uid: uid,
            // tagId: widget.tag.id,
            translate: translate,
            colorScheme: LasotuviAppStyle.colorScheme,
            child: (chartHasTags) =>
                // CheckBoxChartListWidget(
                //   snapshot.requireData,
                //   uid: uid,
                //   tagId: tagId,
                //   translate: translate,
                //   colorScheme: colorScheme,
                //   onSubmit: onSubmit,
                //   onCancel: onCancel,
                //   onItemTap: onItemTap,
                // );

                CheckBoxChartListWidget(
                  chartHasTags,
                  uid: uid,
                  tagId: widget.tag.id,
                  translate: translate,
                  colorScheme: LasotuviAppStyle.colorScheme,
                  onCancel: onCancel,
                  onSubmit: onSubmit,
                  onItemTap: (context, chart, _) =>
                      ChartHelper.openChartView(context: context, chart: chart),
                ));
  }

  void onCancel(BuildContext context) {
    context.pop();
  }

  Future<void> onSubmit(BuildContext context,
      Iterable<SelectableItem<ChartHasTags>> chartHasTags, String? uid) async {
    final connectedCharts = chartHasTags
        .where(
          (element) => !element.initSelected && element.selected,
        )
        .map((e) => e.data.source);

    final disConnectedCharts = chartHasTags
        .where(
          (element) => element.initSelected && !element.selected,
        )
        .map((e) => e.data.source);
    if (connectedCharts.isNotEmpty) {
      await ref
          .read(connectChartsToTagProvider)
          .call(uid: uid, right: widget.tag, lefts: connectedCharts);
    }

    if (disConnectedCharts.isNotEmpty) {
      await ref
          .read(disConnectChartsFromTagProvider)
          .call(uid: uid, right: widget.tag, lefts: disConnectedCharts);
    }
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.pop();
      }
    });
  }
}
