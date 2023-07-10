import '../../zone/time_zone.dart';
import 'gregorian_date.dart';

List<GregorianDate> getGregorianDatesBetween({
  required DateTime from,
  required DateTime to,
  required TimeZone timeZone,
}) {
  final List<GregorianDate> result = [];
  result.add(GregorianDate.fromDateTime(dateTime: from, timeZone: timeZone));
  final delta = to.difference(from);
  for (var i = 1; i <= delta.inDays; i++) {
    result.add(
      GregorianDate.fromDateTime(
        dateTime: from.add(Duration(days: i)),
        timeZone: timeZone,
      ),
    );
  }
  return result;
}
