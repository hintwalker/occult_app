part of sunoom;

List<Moment> getDatesInAMonth(int year, int month, TimeZone timeZone) {
  final gregorians = getGregorianDatesInAMonth(year, month, timeZone);
  return gregorians
      .map((gregorian) => Moment.fromGregorian(gregorian))
      .toList();
}
