part of sunoom;

gregorianFromJdnLocal(double jdn, TimeZone timeZone) {
  final date = gregorianFromJdnUt(jdn + timeZone.offsetInHour / hoursPerDay);
  return date.copyWith(timeZone: timeZone);
}
