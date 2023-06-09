import 'package:flutter/material.dart';

import 'chart_watching_year_input.dart';

class ChartCreationStep3 extends StatelessWidget {
  const ChartCreationStep3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 48),
      child: Center(
        child: SizedBox(
          width: 128,
          child: ChartWatchingYearInput(),
        ),
      ),
    );
  }
}
