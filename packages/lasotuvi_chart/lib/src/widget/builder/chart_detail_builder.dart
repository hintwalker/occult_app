import 'package:flutter/material.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_settings/tauari_settings.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_chart_diagram/tuvi_chart_diagram.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

class ChartDetailBuilder extends StatefulWidget {
  const ChartDetailBuilder({
    super.key,
    required this.chartDetailController,
    required this.uid,
    required this.syncStatus,
    required this.colorScheme,
    required this.translate,
    required this.chartId,
    required this.onOpenStarsModal,
    required this.onOpenBooksModal,
    required this.onOpenChartOptions,
    required this.onOpenChartEditOptions,
    required this.onOpenTuHoaList,
    // required this.topBanner,
  });
  final String? uid;
  final String? syncStatus;
  final String chartId;
  // final Widget? topBanner;
  final ColorScheme colorScheme;
  final ChartDetailController chartDetailController;
  final String Function(String) translate;
  final void Function() onOpenStarsModal;
  final void Function() onOpenBooksModal;
  final void Function() onOpenTuHoaList;
  final void Function(Function(Map<String, dynamic>) callback)
      onOpenChartOptions;
  final void Function(BuildContext context, Chart chart) onOpenChartEditOptions;

  @override
  State<ChartDetailBuilder> createState() => _ChartDetailBuilderState();
}

class _ChartDetailBuilderState extends State<ChartDetailBuilder> {
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
    return BasicFutureBuilder(
      future: widget.chartDetailController.takeById(
        uid: widget.uid,
        id: int.parse(widget.chartId),
        syncStatus: widget.syncStatus,
      ),
      child: (data) => ChartDetailModal(
        data,
        // topBanner: widget.topBanner,
        translate: widget.translate,
        colorScheme: widget.colorScheme,
        onOpenBooksModal: widget.onOpenBooksModal,
        onOpenStarsModal: widget.onOpenStarsModal,
        onOpenChartEditOptions: widget.onOpenChartEditOptions,
        onOpenTuHoaList: widget.onOpenTuHoaList,
        onOpenChartOptions: () =>
            widget.onOpenChartOptions(gridController!.updateOptions),
        child: ChartDetailWidget(
          data,
          translate: widget.translate,
          colorScheme: widget.colorScheme,
          controller: gridController!,
        ),
      ),
    );
    // return BasicStreamBuilder(
    //   stream: widget.chartDetailController.stream(
    //     uid: widget.uid,
    //     docId: int.parse(widget.chartId),
    //     syncStatus: widget.syncStatus,
    //   ),
    //   child: (data) => ChartDetailModal(
    //     data,
    //     colorScheme: widget.colorScheme,
    //     onOpenBooksModal: widget.onOpenBooksModal,
    //     onOpenStarsModal: widget.onOpenStarsModal,
    //     onOpenChartEditOptions: widget.onOpenChartEditOptions,
    //     onOpenChartOptions: () =>
    //         widget.onOpenChartOptions(gridController!.updateOptions),
    //     child: ChartDetailWidget(
    //       data,
    //       translate: widget.translate,
    //       colorScheme: widget.colorScheme,
    //       controller: gridController!,
    //     ),
    //   ),
    // );
  }
}
