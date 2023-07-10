import '../utils/string_format_2_digits.dart';
import '../zone/time_zone.dart';

abstract class SimpleDate {
  final int year, month, day;
  final TimeZone timeZone;
  const SimpleDate({
    required this.year,
    required this.month,
    required this.day,
    required this.timeZone,
  });

  // factory SimpleDate.luniSolar({
  //   required int year,
  //   required int month,
  //   required int day,
  //   bool isLeapMonth = false,
  //   required TimeZone timeZone,
  // }) {
  //   return LuniSolarDate(
  //     year: year,
  //     month: month,
  //     day: day,
  //     timeZone: timeZone,
  //     isLeapMonth: isLeapMonth,
  //   );
  // }
  // const factory SimpleDate({
  //   required int year,
  //   required int month,
  //   required int day,
  //   @Default(TimeZone(offsetInHour: 0)) TimeZone timeZone,
  // }) = GregorianDate;

  String toDateString() {
    return '${stringFormat2Digits(day)}/${stringFormat2Digits(month)}/${stringFormat2Digits(year)}';
  }
}
