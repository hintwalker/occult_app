import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../../router/router_params.dart';
import '../../auth/auth_depended_state.dart';

class ChartDetailBody extends ConsumerStatefulWidget {
  const ChartDetailBody({
    super.key,
    required this.chartId,
    required this.syncStatus,
  });
  final String chartId;
  final String? syncStatus;

  @override
  ConsumerState<ChartDetailBody> createState() => _ChartDetailBodyState();
}

class _ChartDetailBodyState extends AuthDependedState<ChartDetailBody> {
  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const BasicModal(
            title: '',
            colorScheme: LasotuviAppStyle.colorScheme,
            child: Center(child: LoadingWidget()))
        : ChartDetailBuilder(
            uid: uid,
            chartId: widget.chartId,
            syncStatus: RouterParams.getPathParamValue(widget.syncStatus),
            controller: ref.watch(chartDetailControllerProvider),
            child: (chart) => ChartDetailModal(
              chart,
              colorScheme: LasotuviAppStyle.colorScheme,
              child: ChartDetailWidget(
                chart,
                translate: translate,
                colorScheme: LasotuviAppStyle.colorScheme,
              ),
            ),
          );
  }
}
