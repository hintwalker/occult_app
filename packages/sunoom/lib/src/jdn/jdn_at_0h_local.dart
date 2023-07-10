import '../constants/time_constants.dart';
import 'jdn_at_0h_ut.dart';

double jdnAt0hLocal(int year, int month, int day, int timeZoneOffsetInHour) {
  return jdnAt0hUt(year, month, day) - timeZoneOffsetInHour / hoursPerDay;
}
