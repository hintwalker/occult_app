import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:tauari_settings/tauari_settings.dart';
import 'package:tuvi_chart_diagram/tuvi_chart_diagram.dart';
import 'package:tuvi_domain/tuvi_domain.dart';
import '../../library/navigation/library_navigation.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
import '../../auth/user_auth_depended_state.dart';
import '../navigation/chart_navigation.dart';

class ChartDetailModalScreen extends ConsumerStatefulWidget {
  const ChartDetailModalScreen({
    super.key,
    required this.chartId,
    required this.syncStatus,
  });
  final String chartId;
  final String? syncStatus;

  @override
  ConsumerState<ChartDetailModalScreen> createState() =>
      _ChartDetailModalScreenState();
}

class _ChartDetailModalScreenState
    extends UserAuthDependedState<ChartDetailModalScreen> {
  TuviChartGridController? gridController;
  @override
  void initState() {
    super.initState();
    gridController = TuviChartGridController(options: getSavedOptions());
    gridController!.addListener(listenToGridController);
  }

  void listenToGridController() => setState(() {});

  @override
  void dispose() {
    gridController?.removeListener(listenToGridController);
    super.dispose();
  }

  Map<String, dynamic> getSavedOptions() {
    return TauariSettings.getAll(
        chartOptionsBoxName, SkyConfig.basicOptions.keys,
        defaultValue: 0);
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(chartDetailControllerProvider);
    // return findingUid
    //     ? const BasicLoadingModal(
    //         colorScheme: LasotuviAppStyle.colorScheme,
    //       )
    //     : BasicStreamBuilder(
    //         stream: controller.stream(
    //             uid: uid,
    //             docId: int.parse(widget.chartId),
    //             syncStatus: widget.syncStatus),
    //         child: (data) => data == null
    //             ? const ErrorTextWidget()
    //             : ChartDetailModal(
    //                 data,
    //                 colorScheme: LasotuviAppStyle.colorScheme,
    //                 onOpenBooksModal: () =>
    //                     LibraryNavigation.showBooksScreen(context),
    //                 onOpenStarsModal: () =>
    //                     LibraryNavigation.showStarsScreen(context),
    //                 onOpenChartEditOptions: (context, chart) =>
    //                     ChartNavigation.openChartEditOptions(context, chart,
    //                         callback: () => setState(() {})),
    //                 onOpenChartOptions: () => (callback) =>
    //                     ChartNavigation.showChartOptions(
    //                         context: context, ref: ref, callback: callback),
    //                 child: ChartDetailWidget(
    //                   data,
    //                   translate: translate,
    //                   colorScheme: LasotuviAppStyle.colorScheme,
    //                   controller: gridController!,
    //                 ),
    //               ),
    //       );

    return findingUid
        ? const BasicLoadingModal(
            colorScheme: LasotuviAppStyle.colorScheme,
          )
        : ChartDetailBuilder(
            chartDetailController: controller,
            uid: uid,
            syncStatus: widget.syncStatus,
            colorScheme: LasotuviAppStyle.colorScheme,
            translate: translate,
            chartId: widget.chartId,
            onOpenBooksModal: () => LibraryNavigation.showBooksScreen(context),
            onOpenStarsModal: () => LibraryNavigation.showStarsScreen(context),
            onOpenChartOptions: (callback) => ChartNavigation.showChartOptions(
                context: context, ref: ref, callback: callback),
            onOpenChartEditOptions: (context, chart) =>
                ChartNavigation.openChartEditOptions(context, chart,
                    callback: () => setState(() {})),
          );
    // : BasicStreamBuilder(
    //     stream: ref.watch(chartDetailControllerProvider).stream(
    //           uid: uid,
    //           docId: int.parse(widget.chartId),
    //           syncStatus: widget.syncStatus,
    //         ),
    //     child: (data) => ChartDetailModal(
    //       data,
    //       colorScheme: LasotuviAppStyle.colorScheme,
    //       onOpenBooksModal: () =>
    //           LibraryNavigation.showBooksScreen(context),
    //       onOpenStarsModal: () =>
    //           LibraryNavigation.showStarsScreen(context),
    //       onOpenChartOptions: () => ChartNavigation.showChartOptions(
    //           context: context,
    //           ref: ref,
    //           callback: controller.updateOptions),
    //       child: ChartDetailWidget(
    //         data,
    //         translate: translate,
    //         colorScheme: LasotuviAppStyle.colorScheme,
    //         controller: controller,
    //       ),
    //     ),
    //   );
  }
}
