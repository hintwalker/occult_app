import '../../jdn/jdn_at_0h_local.dart';
import '../../jdn/jdn_at_0h_ut.dart';
import '../../zone/time_zone.dart';
import '../gregorian/gregorian_from_jdn_local.dart';
import '../gregorian/gregorian_from_jdn_ut.dart';
import '../simple_time.dart';

SimpleTime timeFromJdnUt(double jdn) {
  final date = gregorianFromJdnUt(jdn);
  final jdn0h = jdnAt0hUt(date.year, date.month, date.day);
  return timeFromJdn(jdnTarget: jdn, jdn0h: jdn0h);
}

SimpleTime timeFromJdn({required double jdnTarget, required double jdn0h}) {
  final hieu = jdnTarget - jdn0h;
  final time = hieu * 24;
  final hour = time.floor();
  final minute = (time - hour) * 60;
  final minuteRound = minute.floor();
  final second = (minute - minuteRound) * 60;
  return SimpleTime(hour: hour, minute: minuteRound, second: second.floor());
}

SimpleTime timeFromJdnLocal(double jdn, TimeZone timeZone) {
  final date = gregorianFromJdnLocal(jdn, timeZone);
  final jdn0h = jdnAt0hLocal(
    date.year,
    date.month,
    date.day,
    timeZone.offsetInHour,
  );
  return timeFromJdn(jdnTarget: jdn, jdn0h: jdn0h);
}
