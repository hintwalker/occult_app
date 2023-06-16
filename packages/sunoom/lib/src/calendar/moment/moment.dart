part of sunoom;

// @freezed
class Moment {
  final GregorianDate gregorian;
  final SimpleTime time;
  final TimeZone timeZone;
  // const Moment._();
  const Moment({
    required this.gregorian,
    // required SimpleDate luni,
    required this.time,
    required this.timeZone,
  });
  factory Moment.fromJdnLocal(double jdn, TimeZone timeZone) {
    final gregorian = gregorianFromJdnLocal(jdn, timeZone);
    final time = timeFromJdnLocal(jdn, timeZone);
    return Moment(
      gregorian: gregorian,
      time: time,
      timeZone: timeZone,
    );
    // final luni = gregorian2LuniSolar(gregorian);
  }
  LuniSolarDate get luniSolarDate {
    return gregorian2LuniSolar(gregorian: gregorian, time: time);
  }

  factory Moment.fromGregorian(GregorianDate gregorian, [SimpleTime? time]) {
    return Moment(
      gregorian: gregorian,
      time: time ?? SimpleTime(hour: 0, minute: 0, second: 0),
      timeZone: gregorian.timeZone,
    );
  }

  factory Moment.fromLuniSolar({
    required LuniSolarDate date,
    required SimpleTime time,
  }) {
    final gregorian = luniSolar2Gregorian(date);
    return Moment(
      gregorian: gregorian,
      // luni: date,
      time: time,
      timeZone: date.timeZone,
    );
  }

  DateTime toDateTime() {
    return DateTime(
        gregorian.year, gregorian.month, gregorian.day, time.hour, time.minute);
  }

  String toGregorianDateString() {
    return '${stringFormat2Digits(gregorian.day)}/${stringFormat2Digits(gregorian.month)}/${stringFormat2Digits(gregorian.year)}';
  }

  String toGregorianDateTimeString() {
    return '${stringFormat2Digits(gregorian.day)}/${stringFormat2Digits(gregorian.month)}/${stringFormat2Digits(gregorian.year)}, ${stringFormat2Digits(time.hour)}:${stringFormat2Digits(time.minute)}';
  }

  String toLuniSolarDateString({
    required String Function(Can) canName,
    required String Function(Chi) chiName,
  }) {
    final luniSolar = gregorian2LuniSolar(gregorian: gregorian, time: time);
    return '${stringFormat2Digits(luniSolar.day)}/${stringFormat2Digits(luniSolar.month)} ${canName(Can.ofLuniYear(luniSolar.year))} ${chiName(Chi.ofLuniYear(luniSolar.year))}';
  }

  @override
  String toString() {
    final luniSolar = gregorian2LuniSolar(gregorian: gregorian, time: time);
    return '${stringFormat2Digits(gregorian.day)}/${stringFormat2Digits(gregorian.month)}/${stringFormat2Digits(gregorian.year)} (${stringFormat2Digits(luniSolar.day)}.${stringFormat2Digits(luniSolar.month)}.${stringFormat2Digits(luniSolar.year)}), ${stringFormat2Digits(time.hour)}:${stringFormat2Digits(time.minute)}';
  }

  Moment add(Duration duration) {
    final dateTime = toDateTime().add(duration);
    return dateTime.toMoment(timeZone);
  }

  Moment subtract(Duration duration) {
    final dateTime = toDateTime().subtract(duration);
    return dateTime.toMoment(timeZone);
  }

  Moment tomorrow() {
    return add(const Duration(days: 1));
  }

  Moment yesterday() {
    return subtract(const Duration(days: 1));
  }
}
