import '../../zone/time_zone.dart';
import 'gregorian_date.dart';

extension GregorianFromDateTime on DateTime {
  GregorianDate toGregorian(TimeZone timeZone) {
    return GregorianDate(
        year: year, month: month, day: day, timeZone: timeZone);
  }
}
