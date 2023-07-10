import '../zone/time_zone.dart';
import 'count_months_from_1jan1900ut.dart';
import 'jdn_on_new_moon_day.dart';
import 'shift_jdn_to_0h_local.dart';

double nextFirstJdnNovOfLeapYear(double currentJdn, TimeZone timeZone) {
  final monthOffset = countMonthsFrom1Jan1900Ut(currentJdn) + 1;
  final jdnNewMoon = jdnOnNewMoonDay(monthOffset + 13);
  return shiftJdnTo0hLocal(jdnNewMoon, timeZone);
}
