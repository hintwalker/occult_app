import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../../auth/auth_depended_state.dart';
import 'controller/modify_chart_controller.dart';

class ModifyChartAvatarBody extends ConsumerStatefulWidget {
  const ModifyChartAvatarBody({
    super.key,
    required this.chartId,
    required this.syncStatus,
  });
  // final Chart chart;
  final int chartId;
  final String? syncStatus;

  @override
  ConsumerState<ModifyChartAvatarBody> createState() =>
      _ModifyChartAvatarBodyState();
}

class _ModifyChartAvatarBodyState
    extends AuthDependedState<ModifyChartAvatarBody> {
  // Chart? chart;
  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     chart = widget.chart;
  //   });
  // }

  // @override
  // void didUpdateWidget(covariant ModifyChartAvatarBody oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   setState(() {
  //     chart = widget.chart;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final processing = ref.watch(modifyChartControllerProvider);
    return ModifyChartAvatarModal(
      title: translate('modifyAvatar'),
      child: findingUid || processing
          ? const LoadingWidget()
          : BasicStreamBuilder(
              stream: ref.watch(chartDetailControllerProvider).stream(
                    uid: uid,
                    docId: widget.chartId,
                    syncStatus: widget.syncStatus,
                  ),
              child: (data) => ModifyChartAvatarWidget(
                data,
                translate: translate,
                onUpdate: (chart) => ref
                    .read(modifyChartControllerProvider.notifier)
                    .updateChart(
                        context: context, uid: uid, chart: chart, ref: ref),
              ),
            ),
    );
  }
}
