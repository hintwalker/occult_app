import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

// import 'execute_build_chart.dart';
import 'grid.dart';
import 'tuvi_chart_grid_controller.dart';

class TuviChartContainer extends StatelessWidget {
  const TuviChartContainer(
    this.data, {
    super.key,
    required this.translate,
    required this.colorScheme,
    required this.controller,
  });
  final Chart data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final TuviChartGridController controller;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context);
    final size = screen.size;
    // final GridController controller = GridController();
    // final chart = ref.watch(chartProvider(int.parse(chartId)));
    // final width = MediaQuery.of(context).size.width.floorToDouble();
    // final height =
    //     (MediaQuery.of(context).size.height - AppBar().preferredSize.height)
    //             .floorToDouble() -
    //         34;
    // final humanBio = data.toHumanBio();
    // final tuviChart = buildTuViChart(
    //     humanBio: humanBio,
    //     sky: Sky(SkyConfig.tuViVietNam()),
    //     starIterator: StarIterator(starIteratorTranDoan),
    //     formulas: starFormulasTranDoan);
    return BasicFutureBuilder(
        future: controller.future(data),
        child: (data) => data == null
            ? const SizedBox.shrink()
            : SizedBox(
                width: size.width,
                height: size.height -
                    48 -
                    screen.padding.top -
                    screen.padding.bottom,
                child: TuviChartGrid(
                  data,
                  translate: translate,
                  colorScheme: colorScheme,
                  controller: controller,
                  humanBio: data.humanBio,
                )));

    // return Zoom(
    //   backgroundColor: lightColorScheme.background,
    //   initTotalZoomOut: true,
    //   child: SizedBox(width: width, height: height, child: TuviChartGrid()),
    //   maxZoomHeight: height,
    //   maxZoomWidth: width,
    //   enableScroll: false,
    //   doubleTapScaleChange: 1,
    // );
  }
}
