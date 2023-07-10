import '../../calendar/gregorian/gregorian_from_date_time.dart';

import '../../conversion/gregorian_2_luni_solar.dart';
import '../../zone/time_zone.dart';
import '../simple_time.dart';
import 'luni_solar_date.dart';

extension LuniSolarFromDateTime on DateTime {
  LuniSolarDate toLuniSolar(TimeZone timeZone) {
    final gregorian = toGregorian(timeZone);
    return gregorian2LuniSolar(
        gregorian: gregorian,
        time: SimpleTime(hour: hour, minute: minute, second: second));
  }
}
