part of sunoom;

int countDaysInGregorianMonth(int year, int month) {
  final isLeapYear = isGregorianYearLeap(year);
  if (isLeapYear) {
    return [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month - 1];
  } else {
    return [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month - 1];
  }
}
