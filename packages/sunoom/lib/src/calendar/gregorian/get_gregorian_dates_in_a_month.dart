import '../../zone/time_zone.dart';
import 'count_days_in_gregorian_month.dart';
import 'get_gregorian_dates_between.dart';
import 'gregorian_date.dart';

List<GregorianDate> getGregorianDatesInAMonth(
    int year, int month, TimeZone timeZone) {
  final count = countDaysInGregorianMonth(year, month);
  return getGregorianDatesBetween(
    from: DateTime(year, month, 1),
    to: DateTime(year, month, count),
    timeZone: timeZone,
  );
}
