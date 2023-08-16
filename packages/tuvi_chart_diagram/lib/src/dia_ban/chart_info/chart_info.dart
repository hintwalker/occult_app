import 'package:flutter/material.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import 'am_duong/human_am_duong.dart';
import 'birth_day/human_birthday.dart';
import 'human_gender.dart';
import 'human_name.dart';
import 'menh_chu/menh_chu_widget.dart';
import 'menh_cuc/menh_cuc.dart';
import 'than_chu/than_chu_widget.dart';
import 'than_cu/than_cu.dart';
import 'watching/human_watching_year.dart';

class ChartInfo extends StatelessWidget {
  const ChartInfo({
    super.key,
    required this.chart,
    required this.humanBio,
    required this.translate,
    required this.colorScheme,
  });
  final HumanBio humanBio;
  final TuViChart chart;
  final String Function(String) translate;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 4,
            ),
            HumanName(
              humanBio.name,
              colorScheme: colorScheme,
            ),
            HumanGender(
              humanBio.dnan,
              translate: translate,
            ),
            // Row(
            //   children: [

            //     const SizedBox(
            //       width: 8,
            //     ),

            //   ],
            // ),
            const SizedBox(
              height: 4,
            ),
            HumanBirthDay(humanBio.birthDay, translate: translate),
            const SizedBox(
              height: 4,
            ),
            HumanWatchingYear(humanBio.birthDay,
                watchingYear: humanBio.watchingYear, translate: translate),
            const SizedBox(
              height: 4,
            ),
            HumanAmDuong(
              posOfMenh: chart.posOfMenh.toInt(),
              bornYear: humanBio.birthDay.luniSolarDate.year,
              translate: translate,
            ),
            const SizedBox(
              height: 4,
            ),
            MenhCuc(
              humanBio: humanBio,
              banMenh: chart.banMenh,
              cuc: chart.cuc,
              translate: translate,
            ),
            const SizedBox(
              height: 4,
            ),
            ThanCu(
              chart,
              translate: translate,
            ),
            const SizedBox(
              height: 4,
            ),
            MenhChuWidget(
              chart.posOfMenh,
              translate: translate,
            ),
            const SizedBox(
              height: 4,
            ),
            ThanChuWidget(
              humanBio.birthDay.luniSolarDate.year,
              translate: translate,
            ),
          ],
        ),
      ),
    );
  }
}
