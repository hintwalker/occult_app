import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../../auth/auth_depended_state.dart';
import 'controller/modify_chart_controller.dart';

class ModifyWatchingYearBody extends ConsumerStatefulWidget {
  const ModifyWatchingYearBody({
    super.key,
    required this.chartId,
    required this.syncStatus,
  });
  final int chartId;
  final String? syncStatus;

  @override
  ConsumerState<ModifyWatchingYearBody> createState() =>
      _ModifyWatchingYearBodyState();
}

class _ModifyWatchingYearBodyState
    extends AuthDependedState<ModifyWatchingYearBody> {
  @override
  Widget build(BuildContext context) {
    final processing = ref.watch(modifyChartControllerProvider);
    return findingUid || processing
        ? const LoadingWidget()
        : BasicStreamBuilder(
            stream: ref.read(chartDetailControllerProvider).stream(
                  uid: uid,
                  docId: widget.chartId,
                  syncStatus: widget.syncStatus,
                ),
            child: (data) => ModifyWatchingYearModal(
              title: translate('modifyWatchingYear'),
              child: ModifyWatchingYearWidget(
                data,
                colorScheme: LasotuviAppStyle.colorScheme,
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
