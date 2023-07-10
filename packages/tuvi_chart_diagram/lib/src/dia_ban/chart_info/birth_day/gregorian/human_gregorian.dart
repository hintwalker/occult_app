import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

import '../../item_container.dart';
import '../../item_text_style.dart';
import '../human_item_title.dart';

class HumanGregorian extends StatelessWidget {
  const HumanGregorian(
    this.birthDay, {
    super.key,
    required this.translate,
  });
  final String Function(String) translate;
  final Moment birthDay;

  @override
  Widget build(BuildContext context) {
    final dayOfWeek = WeekDay.fromDateTime(birthDay.toDateTime());
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        HumanItemTitle(
          'duongLich',
          translate: translate,
        ),
        const SizedBox(
          width: 16,
        ),
        ItemContainer(Text(
          translate(dayOfWeek.name),
          style: itemTextStyle,
        ))
      ]),
      const SizedBox(
        height: 2,
      ),
      ItemContainer(
        Text(
          birthDay.toGregorianDateTimeString(),
          style: itemTextStyle,
        ),
      )
    ]);
  }
}
