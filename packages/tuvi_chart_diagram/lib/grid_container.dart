part of tuvi_chart_diagram;

class TuviChartContainer extends StatelessWidget {
  const TuviChartContainer(
    this.data, {
    super.key,
    required this.translate,
    required this.colorScheme,
  });
  final Chart data;
  final String Function(String) translate;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final GridController controller = GridController();
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
    return FutureBuilder(
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return Column(
              // width: width,
              // height: height,
              children: [
                Expanded(
                    child: TuviChartGrid(
                  snapshot.requireData,
                  translate: translate,
                  colorScheme: colorScheme,
                  controller: controller,
                  humanBio: snapshot.requireData.humanBio,
                ))
              ]);
        } else {
          return const Center(
            child: Text('!'),
          );
        }
        //   if (snapshot.connectionState == ConnectionState.waiting) {
        //     return const Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   } else if (snapshot.hasData) {
        //     SizedBox(
        //         width: width,
        //         height: height,
        //         child: TuviChartGrid(
        //           snapshot.requireData,
        //           translate: translate,
        //           colorScheme: colorScheme,
        //           controller: controller,
        //           humanBio: snapshot.requireData.humanBio,
        //         )
        //         //   )
        //         // ]
        //         );
        //     // return InteractiveViewer.builder(
        //     //     minScale: 1,
        //     //     maxScale: 2,
        //     //     builder: (ctx, quad) {
        //     //       return SizedBox(
        //     //           width: width,
        //     //           height: height,
        //     //           child: TuviChartGrid(
        //     //             snapshot.data!,
        //     //             translate: translate,
        //     //             colorScheme: colorScheme,
        //     //             controller: controller,
        //     //             humanBio: snapshot.data!.humanBio,
        //     //           ));
        //     //     });

        //   }
        // else {
        //     return const Center(
        //       child: Text('!'),
        //     );
        //   }
      },
      future: executeBuildChart(data),
    );

    // return AsyncValueWidget<Chart?>(
    //   value: chart,
    //   data: (data) {
    //     if (data == null) return const Text('Error');
    //     final tuviChart = buildTuViChart(
    //         humanBio: HumanBio(
    //             name: data.name,
    //             birthDay: Moment.fromGregorian(GregorianDate(
    //                 year: data.birthday.year,
    //                 month: data.birthday.month,
    //                 day: data.birthday.day)),
    //             watchingYear: data.watchingYear,
    //             gender: data.gender),
    //         sky: Sky(SkyConfig.tranDoan()),
    //         starIterator: StarIterator(starIteratorTranDoan),
    //         formulas: starFormulasTranDoan);
    //     // return Zoom(
    //     //   backgroundColor: lightColorScheme.background,
    //     //   initTotalZoomOut: true,
    //     //   child: SizedBox(
    //     //       width: width, height: height, child: TuviChartGrid(tuviChart)),
    //     //   maxZoomHeight: height,
    //     //   maxZoomWidth: width,
    //     //   enableScroll: false,
    //     // );
    //     return InteractiveViewer.builder(
    //         minScale: 1,
    //         builder: (ctx, quad) {
    //           return SizedBox(
    //               width: width,
    //               height: height,
    //               child: TuviChartGrid(
    //                 tuviChart,
    //                 translate: translate,
    //               ));
    //         });
    //   },
    // );

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
