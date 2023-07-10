import '../../conversion/gregorian_2_luni_solar.dart';
import '../../conversion/luni_solar_2_gregorian.dart';
import '../../zone/time_zone.dart';
import '../simple_time.dart';
import 'luni_solar_date.dart';

int countDaysInLuniSolarMonth(
    int year, int month, bool isLeapMonth, int timeZoneOffset) {
  final endLunarDate = LuniSolarDate(
    day: 30,
    month: month,
    year: year,
    isLeapMonth: isLeapMonth,
    timeZone: TimeZone(offsetInHour: timeZoneOffset),
  );
  final endSolarDate = luniSolar2Gregorian(endLunarDate);
  final confirmLunarDate = gregorian2LuniSolar(
    gregorian: endSolarDate,
    time: SimpleTime(hour: 1),
  );
  return confirmLunarDate.day == 1 ? 29 : 30;
}
