import '../../zone/time_zone.dart';
import '../simple_date.dart';

class LuniSolarDate extends SimpleDate {
  final bool isLeapMonth;
  LuniSolarDate({
    required super.year,
    required super.month,
    required super.day,
    required super.timeZone,
    this.isLeapMonth = false,
  });

  LuniSolarDate copyWith({
    int? year,
    int? month,
    int? day,
    bool? isLeapMonth,
    TimeZone? timeZone,
  }) {
    return LuniSolarDate(
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
      isLeapMonth: isLeapMonth ?? this.isLeapMonth,
      timeZone: timeZone ?? this.timeZone,
    );
  }
}
