part of sunoom;

List<double> firstJdnPerMonthList(
    int countMonths, PairOfFirstJdnNov pairOfFirstJdnNov, TimeZone timeZone) {
  final List<double> result = [];
  result.add(pairOfFirstJdnNov.previous);
  final monthOffset = countMonthsFrom1Jan1900Ut(pairOfFirstJdnNov.previous) + 1;
  for (var index = 1; index < countMonths - 1; index++) {
    final jdnNewMoon = jdnOnNewMoonDay(monthOffset + index);
    final jdnAt00 = shiftJdnTo0hLocal(jdnNewMoon, timeZone);
    result.add(jdnAt00);
  }
  result.add(pairOfFirstJdnNov.current);
  return result;
}
