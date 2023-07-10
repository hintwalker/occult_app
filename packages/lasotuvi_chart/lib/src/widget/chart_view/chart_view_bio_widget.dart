import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tuvi_chart_diagram/tuvi_chart_diagram.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

class ChartViewBioWidget extends StatelessWidget {
  const ChartViewBioWidget(
    this.chart, {
    super.key,
    required this.translate,
  });
  final Chart chart;
  final String Function(String) translate;
  String canName(Can can) => translate(can.name);
  String chiName(Chi chi) => translate(chi.name);

  @override
  Widget build(BuildContext context) {
    final birthday =
        chart.birthday.toMoment(TimeZone(offsetInHour: chart.timeZoneOffset));
    final humanBio = HumanBio(
        name: chart.name,
        gender: chart.gender,
        birthDay: birthday,
        watchingYear: chart.watchingYear);
    final canDay = Can.ofDay(birthday);
    final chiDay =
        Chi.ofGregorianDay(date: birthday.gregorian, time: birthday.time);
    final canMonth = Can.ofLuniMonth(
        year: birthday.luniSolarDate.year, month: birthday.luniSolarDate.month);
    final chiMonth = Chi.ofLuniMonth(birthday.luniSolarDate.month);

    final canTime = Can.ofTime(canOfDay: canDay, time: birthday.time);
    final chiTime = Chi.ofTime(birthday.time);
    // final canChiOfBornYear =
    //     '${translate(canOfBornYear.name)} ${translate(chiOfBornYear.name)}';
    final canChiMonth =
        '${translate(canMonth.name)} ${translate(chiMonth.name)}';
    final canChiDay = '${translate(canDay.name)} ${translate(chiDay.name)}';
    final canChiTime = '${translate(canTime.name)} ${translate(chiTime.name)}';
    final canWatching = Can.ofLuniYear(chart.watchingYear);
    final chiWatching = Chi.ofLuniYear(chart.watchingYear);
    final canChiWatching =
        '${translate(canWatching.name)} ${translate(chiWatching.name)}';
    final yearOldInt = yearOld(
        birthday: birthday,
        now: DateTime(chart.watchingYear).toMoment(birthday.timeZone));
    final yearOldText = '$yearOldInt ${translate("tuoi")}';
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          chart.name,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
          overflow: TextOverflow.fade,
          maxLines: 2,
        ),
        Text(translate(humanBio.dnan.name),
            style: const TextStyle(fontSize: 14.0)),
        const SizedBox(
          height: 8.0,
        ),
        ItemContainer(
          Text(birthday.toGregorianDateTimeString(),
              style: const TextStyle(
                letterSpacing: 1.2,
              )),
        ),
        const SizedBox(
          height: 2.0,
        ),
        ItemContainer(
          Text(
              birthday.toLuniSolarDateString(
                  canName: canName, chiName: chiName),
              style: const TextStyle(
                letterSpacing: 1.2,
              )),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          '${translate("gio")} $canChiTime',
          style: const TextStyle(
            fontSize: 14,
            letterSpacing: 1.2,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          '${translate("ngay")} $canChiDay',
          style: const TextStyle(
            fontSize: 14,
            letterSpacing: 1.2,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          '${translate("thang")} $canChiMonth',
          style: const TextStyle(
            fontSize: 14,
            letterSpacing: 1.2,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8.0),
        ItemContainer(
          Text(
            '${chart.watchingYear} ($yearOldText)',
            style: const TextStyle(
              letterSpacing: 1.2,
            ),
          ),
        ),
        Text(canChiWatching,
            style: const TextStyle(
              letterSpacing: 1.2,
              fontStyle: FontStyle.italic,
            )),
      ],
    );
  }
}
