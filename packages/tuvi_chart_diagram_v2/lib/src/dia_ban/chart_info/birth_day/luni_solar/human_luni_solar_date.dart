import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

import '../../item_container.dart';
import '../../item_text_style.dart';

class HumanLuniSolarDate extends StatelessWidget {
  const HumanLuniSolarDate(this.birthday, {super.key, required this.translate});
  final String Function(String) translate;
  final Moment birthday;

  @override
  Widget build(BuildContext context) {
    final chiOfBornYear = Chi.ofLuniYear(birthday.luniSolarDate.year);
    final canOfBornYear = Can.ofLuniYear(birthday.luniSolarDate.year);

    final canDay = Can.ofDay(birthday);
    final chiDay =
        Chi.ofGregorianDay(date: birthday.gregorian, time: birthday.time);
    final canMonth = Can.ofLuniMonth(
        year: birthday.luniSolarDate.year, month: birthday.luniSolarDate.month);
    final chiMonth = Chi.ofLuniMonth(birthday.luniSolarDate.month);

    final canTime = Can.ofTime(canOfDay: canDay, time: birthday.time);
    final chiTime = Chi.ofTime(birthday.time);
    final canChiOfBornYear =
        '${translate(canOfBornYear.name)} ${translate(chiOfBornYear.name)}';
    final canChiMonth =
        '${translate(canMonth.name)} ${translate(chiMonth.name)}';
    final canChiDay = '${translate(canDay.name)} ${translate(chiDay.name)}';
    final canChiTime = '${translate(canTime.name)} ${translate(chiTime.name)}';
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          ItemContainer(
            Text(
              birthday.luniSolarDate.toDateString(),
              style: itemTextStyle,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          ItemContainer(
            Text(
              '${translate("tuoi")} $canChiOfBornYear',
              style: itemTextStyle,
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 2,
      ),
      Wrap(
        runSpacing: 2.0,
        children: [
          Text(
            '${translate("ngay")} $canChiDay',
            style: itemTextStyle,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            '${translate("thang")} $canChiMonth',
            style: itemTextStyle,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            '${translate("gio")} $canChiTime',
            style: itemTextStyle,
          ),
        ],
      ),
    ]);
  }
}
