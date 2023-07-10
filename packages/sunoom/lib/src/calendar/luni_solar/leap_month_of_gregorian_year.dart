import '../../zone/time_zone.dart';
import 'luni_solar_month.dart';
import 'luni_solar_year.dart';

LuniSolarMonth? leapMonthOfGregorianYear(int year, TimeZone timeZone) {
  final luniSolarYear = LuniSolarYear.fromGregorianYear(year, timeZone);
  return luniSolarYear.leapMonth();
}
