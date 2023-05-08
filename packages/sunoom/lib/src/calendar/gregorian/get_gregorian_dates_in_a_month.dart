part of sunoom;

List<GregorianDate> getGregorianDatesInAMonth(
    int year, int month, TimeZone timeZone) {
  final count = countDaysInGregorianMonth(year, month);
  return getGregorianDatesBetween(
    from: DateTime(year, month, 1),
    to: DateTime(year, month, count),
    timeZone: timeZone,
  );
}
