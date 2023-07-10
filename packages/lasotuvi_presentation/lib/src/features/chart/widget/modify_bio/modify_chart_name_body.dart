import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../../auth/auth_depended_state.dart';
import 'controller/modify_chart_controller.dart';

class ModifyChartNameBody extends ConsumerStatefulWidget {
  const ModifyChartNameBody({
    super.key,
    required this.chartId,
    required this.syncStatus,
  });
  final int chartId;
  final String? syncStatus;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ModifyChartNameBodyState();
}

class _ModifyChartNameBodyState extends AuthDependedState<ModifyChartNameBody> {
  @override
  Widget build(BuildContext context) {
    final processing = ref.watch(modifyChartControllerProvider);
    return findingUid || processing
        ? const LoadingWidget()
        : ChartModificationOptionsBuilder(
            uid: uid,
            docId: widget.chartId,
            syncStatus: widget.syncStatus,
            controller: ref.read(chartDetailControllerProvider),
            child: (chart) => ModifyChartNameModal(
              title: translate('modifyChartName'),
              child: ModifyChartNameWidget(
                chart: chart,
                translate: translate,
                onUpdate: (chart) => ref
                    .read(modifyChartControllerProvider.notifier)
                    .updateChart(
                      context: context,
                      uid: uid,
                      chart: chart,
                      ref: ref,
                    ),
              ),
            ),
          );
  }
}
