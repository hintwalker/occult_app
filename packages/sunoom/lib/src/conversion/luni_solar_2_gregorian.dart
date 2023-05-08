part of sunoom;

GregorianDate luniSolar2Gregorian(LuniSolarDate luniSolar) {
  int gregYear = luniSolar.year;
  if (luniSolar.month > 10) {
    gregYear = luniSolar.year + 1;
  }
  final luniSolarYear =
      LuniSolarYear.fromGregorianYear(gregYear, luniSolar.timeZone);
  final luniSolarMonth = luniSolarYear.monthOfDate(luniSolar);
  final jdn = luniSolarMonth.jdnOnFirstDay + luniSolar.day - 1;
  final result = Moment.fromJdnLocal(jdn, luniSolar.timeZone);
  return result.gregorian;
}
