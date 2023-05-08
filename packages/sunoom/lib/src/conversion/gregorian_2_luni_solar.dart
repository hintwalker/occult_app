part of sunoom;

LuniSolarDate gregorian2LuniSolar({
  required GregorianDate gregorian,
  SimpleTime? time,
}) {
  var resultYear = gregorian.year;
  var luniSolarYear =
      LuniSolarYear.fromGregorianYear(resultYear, gregorian.timeZone);
  final lastJdnNov = luniSolarYear.months.last.jdnOnFirstDay;
  final jdnOfGivenDate = jdnAt0hLocal(gregorian.year, gregorian.month,
      gregorian.day, gregorian.timeZone.offsetInHour);
  if (jdnOfGivenDate >= lastJdnNov) {
    resultYear += 1;
    luniSolarYear =
        LuniSolarYear.fromGregorianYear(resultYear, gregorian.timeZone);
  }
  var i = luniSolarYear.countMonth() - 1;
  while (jdnOfGivenDate < luniSolarYear.months[i].jdnOnFirstDay) {
    i--;
  }
  final resultMonth = luniSolarYear.months[i];
  final resultDay = (jdnOfGivenDate - resultMonth.jdnOnFirstDay).toInt() + 1;
  if (resultMonth.value >= 11) {
    resultYear--;
  }
  LuniSolarDate luniSolarDate = LuniSolarDate(
    year: resultYear,
    month: resultMonth.value,
    day: resultDay,
    isLeapMonth: resultMonth.isLeap,
    timeZone: gregorian.timeZone,
  );
  if (time != null && time.hour == 23) {
    final moment = Moment.fromGregorian(gregorian);
    luniSolarDate = moment.add(Duration(days: 1)).luniSolarDate;
  }
  return luniSolarDate;
  // return Mome.fromLuniSolarTime(
  //     time: gregorian.time,
  //     year: resultYear,
  //     month: resultMonth.value,
  //     day: resultDay,
  //     isLeapMonth: resultMonth.isLeap,
  //     timeZoneOffsetInHour: gregorian.timeZone
  // );
}
