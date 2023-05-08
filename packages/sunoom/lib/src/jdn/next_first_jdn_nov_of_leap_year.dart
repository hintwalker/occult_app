part of sunoom;

double nextFirstJdnNovOfLeapYear(double currentJdn, TimeZone timeZone) {
  final monthOffset = countMonthsFrom1Jan1900Ut(currentJdn) + 1;
  final jdnNewMoon = jdnOnNewMoonDay(monthOffset + 13);
  return shiftJdnTo0hLocal(jdnNewMoon, timeZone);
}
