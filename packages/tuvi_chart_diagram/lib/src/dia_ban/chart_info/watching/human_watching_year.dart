import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../birth_day/human_item_title.dart';
import '../item_container.dart';
import '../item_text_style.dart';

class HumanWatchingYear extends StatelessWidget {
  const HumanWatchingYear(
    this.birthday, {
    super.key,
    required this.watchingYear,
    required this.translate,
  });
  final int watchingYear;
  final Moment birthday;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    final can = Can.ofLuniYear(watchingYear);
    final chi = Chi.ofLuniYear(watchingYear);
    final canChi = '${translate(can.name)} ${translate(chi.name)}';
    final yearOldInt = yearOld(
        birthday: birthday,
        now: DateTime(watchingYear).toMoment(birthday.timeZone));
    final yearOldText = '$yearOldInt ${translate("tuoi")}';
    return Wrap(
      runSpacing: 2.0,
      children: [
        HumanItemTitle('namXem', translate: translate),
        const SizedBox(
          width: 4.0,
        ),
        ItemContainer(
          Text(
            '$watchingYear',
            style: itemTextStyle,
          ),
        ),
        const SizedBox(
          width: 2.0,
        ),
        ItemContainer(
          Text(
            canChi,
            style: itemTextStyle,
          ),
        ),
        const SizedBox(
          width: 2.0,
        ),
        ItemContainer(
          Text(
            yearOldText,
            style: itemTextStyle,
          ),
        ),
      ],
    );
  }
}
