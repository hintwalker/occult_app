import '../moon/new_moon_jdn.dart';
import 'count_months_from_1jan1900ut.dart';
import 'jdn_at_0h_local.dart';
import 'jdn_on_new_moon_day.dart';

NewMoonJdn jdnOfNewMoonLocal(int gregorianYear, int timeZoneOffsetInHour) {
  final jdnIn31Dec = jdnAt0hLocal(gregorianYear, 12, 31, timeZoneOffsetInHour);
  final monthOffset = countMonthsFrom1Jan1900Ut(jdnIn31Dec);
  final jdnNewMoon = jdnOnNewMoonDay(monthOffset);
  return NewMoonJdn(monthOffset, jdnNewMoon);
}
