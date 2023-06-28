part of sunoom_calendar_input;

class GregorianDayValidator {
  final String errorMessage = '!';
  final maxDayInMonth = 31;
  final specialMonth = 2;
  final String? Function(String?) validateMonth;
  final String? Function(String?) validateYear;
  const GregorianDayValidator(
      {required this.validateMonth, required this.validateYear});
  String? validate(int? year, int? month, String? day) {
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
      return validateDayIfHasMonth(year, month, intValue);
    }
    return null;
  }

  String? validateDayIfHasMonth(int? year, int month, int day) {
    if (year == null || validateYear(year.toString()) != null) {
      return validateDayIfHasMonthButYear(month, day);
    } else {
      return dayOver(year, month, day) ? errorMessage : null;
    }
  }

  String? validateDayIfHasMonthButYear(int month, int day) {
    if (dayOverInMonthSpecial(month, day)) return errorMessage;
    return dayOver(2001, month, day) ? errorMessage : null;
  }

  bool dayOverInMonthSpecial(int month, int day) {
    return isMonthSpecial(month) ? day > 29 : false;
  }

  bool isMonthSpecial(int month) => month == specialMonth;

  bool dayOver(int year, int month, int day) {
    return day > daysInMonth(year, month);
  }

  int daysInMonth(int year, int month) =>
      countDaysInGregorianMonth(year, month);
}
