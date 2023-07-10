import 'gregorian_date.dart';

extension GregorianToDateTime on GregorianDate {
  DateTime toDateTime() {
    return DateTime(year, month, day);
  }
}
