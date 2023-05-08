part of sunoom;

double jdnAt0hLocal(int year, int month, int day, int timeZoneOffsetInHour) {
  return jdnAt0hUt(year, month, day) - timeZoneOffsetInHour / hoursPerDay;
}
