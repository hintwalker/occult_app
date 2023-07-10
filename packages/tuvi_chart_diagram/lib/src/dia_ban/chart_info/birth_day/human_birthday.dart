import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

import 'gregorian/human_gregorian.dart';
import 'luni_solar/human_luni_solar.dart';

class HumanBirthDay extends StatelessWidget {
  const HumanBirthDay(this.birthday, {super.key, required this.translate});
  final String Function(String) translate;
  final Moment birthday;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HumanGregorian(birthday, translate: translate),
        const SizedBox(
          height: 4,
        ),
        HumanLuniSolar(birthday, translate: translate),
      ],
    );
  }
}
