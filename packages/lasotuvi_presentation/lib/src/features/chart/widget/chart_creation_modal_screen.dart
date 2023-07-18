import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_chart_creation_form/tuvi_chart_creation_form.dart';

import '../navigation/chart_navigation.dart';
import '../../auth/auth_depended_state.dart';

class ChartCreationModalScreen extends ConsumerStatefulWidget {
  const ChartCreationModalScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChartCreationModalScreenState();
}

class _ChartCreationModalScreenState
    extends AuthDependedState<ChartCreationModalScreen> {
  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const BasicLoadingModal(
            colorScheme: LasotuviAppStyle.colorScheme,
          )
        : BasicModal(
            title: translate('createChart'),
            colorScheme: LasotuviAppStyle.colorScheme,
            child: ChartCreationForm(
                colorScheme: LasotuviAppStyle.colorScheme,
                translate: translate,
                onCreateChart: onCreateChart));
  }

  Future<void> onCreateChart(Chart chart) async {
    await ref.read(insertChartToLocalProvider)(chart);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.pop();
        ChartNavigation.openChartView(context: context, chart: chart);
      }
    });
  }
}
