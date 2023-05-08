part of sunoom;

extension GregorianToDateTime on GregorianDate {
  DateTime toDateTime() {
    return DateTime(year, month, day);
  }
}
