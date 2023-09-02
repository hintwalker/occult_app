import 'package:flutter/material.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../birth_day/human_item_title.dart';
import '../item_container.dart';
import '../item_text_style.dart';

class ThanCu extends StatelessWidget {
  const ThanCu(
    this.chart, {
    super.key,
    required this.translate,
  });
  final String Function(String) translate;
  final TuViChart chart;

  @override
  Widget build(BuildContext context) {
    final than = chart.houses[chart.posOfThan]!;
    return Row(
      children: [
        HumanItemTitle(
          'thanCu',
          translate: translate,
        ),
        const SizedBox(
          width: 2,
        ),
        ItemContainer(Text(
          translate(than.name.name),
          style: itemTextStyle,
        ))
      ],
    );
  }
}
