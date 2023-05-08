part of sunoom;

NewMoonJdn jdnOfNewMoonLocal(int gregorianYear, int timeZoneOffsetInHour) {
  final jdnIn31Dec = jdnAt0hLocal(gregorianYear, 12, 31, timeZoneOffsetInHour);
  final monthOffset = countMonthsFrom1Jan1900Ut(jdnIn31Dec);
  final jdnNewMoon = jdnOnNewMoonDay(monthOffset);
  return NewMoonJdn(monthOffset, jdnNewMoon);
}
