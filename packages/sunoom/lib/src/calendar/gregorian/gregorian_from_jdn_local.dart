import '../../constants/time_constants.dart';
import '../../zone/time_zone.dart';
import 'gregorian_from_jdn_ut.dart';

gregorianFromJdnLocal(double jdn, TimeZone timeZone) {
  final date = gregorianFromJdnUt(jdn + timeZone.offsetInHour / hoursPerDay);
  return date.copyWith(timeZone: timeZone);
}
