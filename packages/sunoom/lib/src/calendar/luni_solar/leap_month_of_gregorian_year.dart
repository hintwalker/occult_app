part of sunoom;

LuniSolarMonth? leapMonthOfGregorianYear(int year, TimeZone timeZone) {
  final luniSolarYear = LuniSolarYear.fromGregorianYear(year, timeZone);
  return luniSolarYear.leapMonth();
}
