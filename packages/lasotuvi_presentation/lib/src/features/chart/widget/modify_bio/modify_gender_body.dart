import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../../auth/user_auth_depended_state.dart';
import 'controller/modify_chart_controller.dart';

class ModifyGenderBody extends ConsumerStatefulWidget {
  const ModifyGenderBody({
    super.key,
    required this.chartId,
    required this.syncStatus,
    this.callback,
  });
  final int chartId;
  final String? syncStatus;
  final void Function()? callback;

  @override
  ConsumerState<ModifyGenderBody> createState() => _ModifyGenderBodyState();
}

class _ModifyGenderBodyState extends UserAuthDependedState<ModifyGenderBody> {
  @override
  Widget build(BuildContext context) {
    final processing = ref.watch(modifyChartControllerProvider);
    return ModifyGenderModal(
      title: translate('modifyGender'),
      child: findingUid || processing
          ? const LoadingWidget()
          : BasicFutureBuilder(
              future: ref.watch(chartDetailControllerProvider).takeById(
                    uid: uid,
                    id: widget.chartId,
                    syncStatus: widget.syncStatus,
                  ),
              child: (data) => ModifyGenderWidget(
                data,
                colorScheme: LasotuviAppStyle.colorScheme,
                translate: translate,
                onUpdate: (chart) async {
                  await ref
                      .read(modifyChartControllerProvider.notifier)
                      .updateChart(
                        context: context,
                        uid: uid,
                        chart: chart,
                        ref: ref,
                      );
                  if (widget.callback != null) {
                    widget.callback!();
                  }
                },
              ),
            ),
      // BasicStreamBuilder(
      //     stream: ref.watch(chartDetailControllerProvider).stream(
      //           uid: uid,
      //           docId: widget.chartId,
      //           syncStatus: widget.syncStatus,
      //         ),
      //     child: (data) => ModifyGenderWidget(
      //       data,
      //       colorScheme: LasotuviAppStyle.colorScheme,
      //       translate: translate,
      //       onUpdate: (chart) async {
      //         await ref
      //             .read(modifyChartControllerProvider.notifier)
      //             .updateChart(
      //               context: context,
      //               uid: uid,
      //               chart: chart,
      //               ref: ref,
      //             );
      //         if (widget.callback != null) {
      //           widget.callback!();
      //         }
      //       },
      //     ),
      //   ),
    );
  }

  // Future<void> updateChart(Chart chart) async {
  //   await ref.read(updateChartProvider).call(uid, chart);
  //   SchedulerBinding.instance.addPostFrameCallback((_) {
  //     if (context.mounted) {
  //       context.pop();
  //     }
  //   });
  // }
}
