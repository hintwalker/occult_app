part of sunoom;

double shiftJdnTo0hLocal(double jdn, TimeZone timeZone) {
  final date = Moment.fromJdnLocal(jdn, timeZone);
  return jdnAt0hLocal(
    date.gregorian.year,
    date.gregorian.month,
    date.gregorian.day,
    timeZone.offsetInHour,
  );
}
