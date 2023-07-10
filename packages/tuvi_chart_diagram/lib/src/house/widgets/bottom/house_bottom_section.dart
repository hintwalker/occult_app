import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import 'house_life_star_view.dart';
import 'house_month_view.dart';
import 'house_year_view.dart';

class HouseBottomSection extends StatelessWidget {
  const HouseBottomSection({
    super.key,
    required this.year,
    required this.month,
    required this.lifeStar,
    required this.translate,
  });
  final Chi year;
  final int month;
  final Star lifeStar;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, left: 1.0, right: 1.0),
      child: Row(
        children: [
          HouseYearView(
            translate(year.name),
          ),
          const SizedBox(
            width: 1.0,
          ),
          Expanded(
              child: HouseLifeStarView(
            translate(lifeStar.name.name),
          )),
          const SizedBox(
            width: 1.0,
          ),
          HouseMonthView(
            month,
            translate: translate,
          )
        ],
      ),
    );
  }
}
