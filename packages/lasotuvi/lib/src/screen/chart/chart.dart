import 'package:flutter/material.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show ChartScreenAppBar, GeneralStyle;
import 'package:tauari_ui/tauari_ui.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({
    super.key,
    this.restorationId,
    required this.chartId,
    // this.uid,
  });
  final String? restorationId;
  // final String? uid;
  final String chartId;

  @override
  Widget build(BuildContext context) {
    return RestorableStatelessWidget(
        restorationId: restorationId,
        child: const Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(GeneralStyle.appBarHeight),
              child: ChartScreenAppBar()),
        ));
  }
}
