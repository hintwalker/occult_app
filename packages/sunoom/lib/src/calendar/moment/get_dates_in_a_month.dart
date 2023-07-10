import '../../zone/time_zone.dart';
import '../gregorian/get_gregorian_dates_in_a_month.dart';
import 'moment.dart';

List<Moment> getDatesInAMonth(int year, int month, TimeZone timeZone) {
  final gregorians = getGregorianDatesInAMonth(year, month, timeZone);
  return gregorians
      .map((gregorian) => Moment.fromGregorian(gregorian))
      .toList();
}
