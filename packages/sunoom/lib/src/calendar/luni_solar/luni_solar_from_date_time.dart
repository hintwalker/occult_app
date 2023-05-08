part of sunoom;

extension LuniSolarFromDateTime on DateTime {
  LuniSolarDate toLuniSolar(TimeZone timeZone) {
    final gregorian = toGregorian(timeZone);
    return gregorian2LuniSolar(
        gregorian: gregorian,
        time: SimpleTime(hour: hour, minute: minute, second: second));
  }
}
