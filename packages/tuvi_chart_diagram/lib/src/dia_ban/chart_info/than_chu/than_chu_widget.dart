import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../birth_day/human_item_title.dart';
import '../item_container.dart';
import '../item_text_style.dart';

class ThanChuWidget extends StatelessWidget {
  const ThanChuWidget(
    this.bornYear, {
    super.key,
    required this.translate,
  });
  final String Function(String) translate;
  final int bornYear;

  @override
  Widget build(BuildContext context) {
    final chiOfBornYear = Chi.ofLuniYear(bornYear);
    final data = thanChu(chiOfBornYear);
    return Row(
      children: [
        HumanItemTitle('thanChu', translate: translate),
        const SizedBox(
          width: 2,
        ),
        ItemContainer(Text(
          translate(data.name),
          style: itemTextStyle,
        ))
      ],
    );
  }
}
