part of sunoom;

extension MomentFromDateTime on DateTime {
  Moment toMoment(TimeZone timeZone) {
    return Moment.fromGregorian(toGregorian(timeZone),
        SimpleTime(hour: hour, minute: minute, second: second));
  }
}
