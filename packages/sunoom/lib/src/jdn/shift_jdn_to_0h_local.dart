import '../calendar/moment/moment.dart';
import '../zone/time_zone.dart';
import 'jdn_at_0h_local.dart';

double shiftJdnTo0hLocal(double jdn, TimeZone timeZone) {
  final date = Moment.fromJdnLocal(jdn, timeZone);
  return jdnAt0hLocal(
    date.gregorian.year,
    date.gregorian.month,
    date.gregorian.day,
    timeZone.offsetInHour,
  );
}
