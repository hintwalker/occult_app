import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart' show Chart;
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_chart_diagram/tuvi_chart_diagram.dart';

class ChartDetailWidget extends StatelessWidget {
  const ChartDetailWidget(
    this.data, {
    super.key,
    required this.translate,
    required this.colorScheme,
  });
  final Chart? data;
  final String Function(String) translate;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return data == null
        ? const Center(child: ErrorTextWidget())
        : TuviChartContainer(data!,
            translate: translate, colorScheme: colorScheme);
    // BasicModal(
    //   title: data.name,
    //   colorScheme: colorScheme,
    //   borderRadius: BorderRadius.circular(0),
    //   child: TuviChartContainer(data,
    //       translate: translate, colorScheme: colorScheme),
    // );
    // return Scaffold(
    //   appBar: PreferredSize(
    //     preferredSize: const Size.fromHeight(40.0),
    //     child: AppBar(
    //         titleSpacing: 0,
    //         title: Text(data.name,
    //             style: TextStyle(
    //               fontSize: 18,
    //               fontWeight: FontWeight.w500,
    //               color: colorScheme.primary,
    //               fontStyle: FontStyle.normal,
    //               letterSpacing: 1.4,
    //             )),
    //         actions: [
    //           IconButton(icon: const Icon(Icons.search), onPressed: () {})
    //         ]),
    //   ),
    //   body: TuviChartContainer(data,
    //       translate: translate, colorScheme: colorScheme),
    // );
  }
}
