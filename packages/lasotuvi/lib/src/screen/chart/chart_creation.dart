import 'package:flutter/material.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show ChartCreationModalScreen;
import 'package:lasotuvi_style/lasotuvi_style.dart';

class ChartCreationScreen extends StatelessWidget {
  const ChartCreationScreen({
    super.key,
    this.restorationId,
  });
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
        restorationId: restorationId,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Chart creation'),
            backgroundColor: LasotuviAppStyle.colorScheme.background,
          ),
          body: const ChartCreationModalScreen(),
          backgroundColor: LasotuviAppStyle.colorScheme.background,
        ));
  }
}
