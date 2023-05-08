part of sunoom;

int countDaysInLuniSolarMonth(
    int year, int month, bool isLeapMonth, int timeZoneOffset) {
  final endLunarDate = LuniSolarDate(
    day: 30,
    month: month,
    year: year,
    isLeapMonth: isLeapMonth,
    timeZone: TimeZone(offsetInHour: timeZoneOffset),
  );
  final endSolarDate = luniSolar2Gregorian(endLunarDate);
  final confirmLunarDate = gregorian2LuniSolar(
    gregorian: endSolarDate,
    time: SimpleTime(hour: 1),
  );
  return confirmLunarDate.day == 1 ? 29 : 30;
}
