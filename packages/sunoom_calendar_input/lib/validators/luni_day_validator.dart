import 'package:sunoom/sunoom.dart' show countDaysInLuniSolarMonth;

class LuniDayValidator {
  final String errorMessage = '!';
  final maxDayInMonth = 30;
  final String? Function(String?) validateMonth;
  final String? Function(String?) validateYear;
  LuniDayValidator({
    required this.validateMonth,
    required this.validateYear,
  });

  String? validate(
    int? year,
    int? month,
    String? day, {
    required bool isMonthLeap,
    required int timeZoneOffset,
  }) {
    if (day == null || day.isEmpty) {
      return errorMessage;
    }
    final intValue = int.parse(day);
    if (intValue < 1 || intValue > maxDayInMonth) {
      return errorMessage;
    }
    if (month != null) {
      if (validateMonth(month.toString()) != null) {
        return intValue < 1 || intValue > maxDayInMonth ? errorMessage : null;
      }
      return validateDayIfHasMonth(
        year,
        month,
        intValue,
        isLeapMonth: isMonthLeap,
        timeZoneOffset: timeZoneOffset,
      );
    }
    return null;
  }

  String? validateDayIfHasMonth(
    int? year,
    int month,
    int day, {
    required bool isLeapMonth,
    required int timeZoneOffset,
  }) {
    if (year == null || validateYear(year.toString()) != null) {
      return validateDayIfHasMonthButYear(month, day);
    } else {
      return dayOver(
        year,
        month,
        day,
        isLeapMonth: isLeapMonth,
        timeZoneOffset: timeZoneOffset,
      )
          ? errorMessage
          : null;
    }
  }

  String? validateDayIfHasMonthButYear(int month, int day) {
    return day > maxDayInMonth ? errorMessage : null;
  }

  bool dayOver(
    int year,
    int month,
    int day, {
    required bool isLeapMonth,
    required int timeZoneOffset,
  }) {
    return day >
        daysInMonth(
          year,
          month,
          isLeapMonth: isLeapMonth,
          timeZoneOffset: timeZoneOffset,
        );
  }

  int daysInMonth(
    int year,
    int month, {
    required bool isLeapMonth,
    required int timeZoneOffset,
  }) =>
      countDaysInLuniSolarMonth(year, month, isLeapMonth, timeZoneOffset);
}
