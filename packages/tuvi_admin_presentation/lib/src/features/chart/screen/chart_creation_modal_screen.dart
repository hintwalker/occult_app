import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_admin_presentation/src/style/admin_app_style.dart';
import 'package:tuvi_chart_creation_form/tuvi_chart_creation_form.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';
import 'package:tuvi_chart_provider/tuvi_chart_provider.dart';

import '../navigator/chart_navigator.dart';

class ChartCreationModalScreen extends ConsumerWidget {
  const ChartCreationModalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasicModal(
      title: translate('createChart'),
      colorScheme: AdminAppStyle.colorScheme,
      child: ChartCreationForm(
          colorScheme: AdminAppStyle.colorScheme,
          translate: translate,
          onCreateChart: (chart) =>
              onCreateChart(chart: chart, context: context, ref: ref)),
    );
  }

  Future<void> onCreateChart({
    required BuildContext context,
    required Chart chart,
    required WidgetRef ref,
  }) async {
    await ref.read(insertChartToLocalProvider)(chart);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.pop();
        ChartNavigator.openChartView(
          context: context,
          chart: chart,
          saveLastView: true,
        );
      }
    });
  }
}

// class _ChartCreationModalScreenState
//     extends UserAuthDependedState<ChartCreationModalScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return findingUid
//         ? const BasicLoadingModal(
//             colorScheme: LasotuviAppStyle.colorScheme,
//           )
//         : BasicModal(
//             title: translate('createChart'),
//             colorScheme: LasotuviAppStyle.colorScheme,
//             child: ChartCreationForm(
//                 colorScheme: LasotuviAppStyle.colorScheme,
//                 translate: translate,
//                 onCreateChart: onCreateChart));
//   }

//   Future<void> onCreateChart(Chart chart) async {
//     await ref.read(insertChartToLocalProvider)(chart);
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       if (context.mounted) {
//         context.pop();
//         ChartNavigation.openChartView(
//           context: context,
//           chart: chart,
//           saveLastView: true,
//         );
//       }
//     });
//   }
// }
