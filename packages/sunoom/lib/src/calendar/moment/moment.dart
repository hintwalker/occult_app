// @freezed
import 'package:tauari_date_format/tauari_date_format.dart';

import '../../calendar/moment/moment_from_date_time.dart';

import '../../can/can.dart';
import '../../chi/chi.dart';
import '../../conversion/gregorian_2_luni_solar.dart';
import '../../conversion/luni_solar_2_gregorian.dart';
import '../../zone/time_zone.dart';
import '../gregorian/gregorian_date.dart';
import '../gregorian/gregorian_from_jdn_local.dart';
import '../luni_solar/luni_solar_date.dart';
import '../simple_time.dart';
import '../time/time_from_jdn.dart';

class Moment {
  final GregorianDate gregorian;
  final SimpleTime time;
  final TimeZone timeZone;
  // const Moment._();
  const Moment({
    required this.gregorian,
    // required SimpleDate luni,
    required this.time,
    required this.timeZone,
  });
  factory Moment.fromJdnLocal(double jdn, TimeZone timeZone) {
    final gregorian = gregorianFromJdnLocal(jdn, timeZone);
    final time = timeFromJdnLocal(jdn, timeZone);
    return Moment(
      gregorian: gregorian,
      time: time,
      timeZone: timeZone,
    );
    // final luni = gregorian2LuniSolar(gregorian);
  }
  LuniSolarDate get luniSolarDate {
    return gregorian2LuniSolar(gregorian: gregorian, time: time);
  }

  factory Moment.now({TimeZone timeZone = const TimeZone(offsetInHour: 7)}) {
    final dateTime = DateTime.now();
    // final currentTimeZoneOffset = dateTime.timeZoneOffset.inHours;
    // final targetDateTime = dateTime.add(Duration(hours: timeZone.offsetInHour - currentTimeZoneOffset));
    return dateTime.toMoment(timeZone);
  }

  factory Moment.fromGregorian(GregorianDate gregorian, [SimpleTime? time]) {
    return Moment(
      gregorian: gregorian,
      time: time ?? SimpleTime(hour: 0, minute: 0, second: 0),
      timeZone: gregorian.timeZone,
    );
  }

  factory Moment.fromLuniSolar({
    required LuniSolarDate date,
    required SimpleTime time,
  }) {
    final gregorian = luniSolar2Gregorian(date);
    return Moment(
      gregorian: gregorian,
      // luni: date,
      time: time,
      timeZone: date.timeZone,
    );
  }

  DateTime toDateTime() {
    return DateTime(
      gregorian.year,
      gregorian.month,
      gregorian.day,
      time.hour,
      time.minute,
    );
  }

  String toGregorianDateString({String dateSeperator = '-'}) {
    return formatDateVn(
      year: gregorian.year,
      month: gregorian.month,
      day: gregorian.day,
      dateSeperator: dateSeperator,
    );
  }

  String toGregorianDateTimeString({
    String dateSeperator = '-',
    String timeSeperator = ':',
  }) {
    return formatGregorianDateTimeVn(
      year: gregorian.year,
      month: gregorian.month,
      day: gregorian.day,
      hour: time.hour,
      minute: time.minute,
      dateSeperator: dateSeperator,
      timeSeperator: timeSeperator,
    );
  }

  String toLuniSolarDateString({
    required String Function(Can) canName,
    required String Function(Chi) chiName,
    String dateSeperator = '-',
  }) {
    final luniSolar = luniSolarDate;
    final dayString = '${stringFormat2Digits(luniSolar.day)}$dateSeperator';
    final monthString = stringFormat2Digits(luniSolar.month);

    final canYear = canName(Can.ofLuniYear(luniSolar.year));
    final chiYear = chiName(Chi.ofLuniYear(luniSolar.year));
    return '$dayString$monthString $canYear $chiYear';
    // return formatLuniDateVn(
    //   year: luniSolar.year,
    //   month: luniSolar.month,
    //   day: luniSolar.day,
    //   canName: (_) => canName(canYear),
    //   chiName: (_) => chiName(chiYear),
    //   dateSeperator: dateSeperator,
    // );
    // return '${stringFormat2Digits(luniSolar.day)}/${stringFormat2Digits(luniSolar.month)} ${canName(Can.ofLuniYear(luniSolar.year))} ${chiName(Chi.ofLuniYear(luniSolar.year))}';
  }

  @override
  String toString({
    String dateSeperator = '-',
    String timeSeperator = ':',
  }) {
    final gregString = toGregorianDateTimeString(
      dateSeperator: dateSeperator,
      timeSeperator: timeSeperator,
    );
    final luniSolar = luniSolarDate;
    final luniString = formatDateVn(
      year: luniSolar.year,
      month: luniSolar.month,
      day: luniSolar.day,
      dateSeperator: dateSeperator,
    );

    return '$gregString ($luniString)';

    // return '${stringFormat2Digits(gregorian.day)}/${stringFormat2Digits(gregorian.month)}/${stringFormat2Digits(gregorian.year)} (${stringFormat2Digits(luniSolar.day)}.${stringFormat2Digits(luniSolar.month)}.${stringFormat2Digits(luniSolar.year)}), ${stringFormat2Digits(time.hour)}:${stringFormat2Digits(time.minute)}';
  }

  Moment add(Duration duration) {
    final dateTime = toDateTime().add(duration);
    return dateTime.toMoment(timeZone);
  }

  Moment subtract(Duration duration) {
    final dateTime = toDateTime().subtract(duration);
    return dateTime.toMoment(timeZone);
  }

  Moment tomorrow() {
    return add(const Duration(days: 1));
  }

  Moment yesterday() {
    return subtract(const Duration(days: 1));
  }

  Moment now() {
    return DateTime.now().toMoment(timeZone);
  }
}
