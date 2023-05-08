part of sunoom;

extension GregorianFromDateTime on DateTime {
  GregorianDate toGregorian(TimeZone timeZone) {
    return GregorianDate(
        year: year, month: month, day: day, timeZone: timeZone);
  }
}
