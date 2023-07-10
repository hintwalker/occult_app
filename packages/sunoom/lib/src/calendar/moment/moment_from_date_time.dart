import '../../calendar/gregorian/gregorian_from_date_time.dart';

import '../../zone/time_zone.dart';
import '../simple_time.dart';
import 'moment.dart';

extension MomentFromDateTime on DateTime {
  Moment toMoment(TimeZone timeZone) {
    return Moment.fromGregorian(toGregorian(timeZone),
        SimpleTime(hour: hour, minute: minute, second: second));
  }
}
