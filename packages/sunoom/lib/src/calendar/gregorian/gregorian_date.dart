part of sunoom;

class GregorianDate extends SimpleDate {
  GregorianDate(
      {required super.year,
      required super.month,
      required super.day,
      required super.timeZone});
  static GregorianDate fromDateTime(
      {required DateTime dateTime, required TimeZone timeZone}) {
    return GregorianDate(
      year: dateTime.year,
      month: dateTime.month,
      day: dateTime.day,
      timeZone: timeZone,
    );
  }

  GregorianDate copyWith({
    int? year,
    int? month,
    int? day,
    TimeZone? timeZone,
  }) {
    return GregorianDate(
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
      timeZone: timeZone ?? this.timeZone,
    );
  }
}
