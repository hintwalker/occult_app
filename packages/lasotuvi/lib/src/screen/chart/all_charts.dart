import 'package:flutter/material.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show AllChartListScreenBody;
import 'package:lasotuvi_style/lasotuvi_style.dart';

class ChartsScreen extends StatelessWidget {
  const ChartsScreen({
    super.key,
    this.restorationId,
  });
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
        restorationId: restorationId,
        child: Container(
            decoration: BoxDecoration(
              color: LasotuviAppStyle.colorScheme.background,
            ),
            child: const AllChartListScreenBody()));
  }
}
