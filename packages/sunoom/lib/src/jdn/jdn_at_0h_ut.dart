part of sunoom;

double jdnAt0hUt(int year, int month, int day) {
  double jd = 0;
  if (year > firstYearOfGregorianCalendar ||
      (year == firstYearOfGregorianCalendar && month > 10) ||
      (year == firstYearOfGregorianCalendar && month == 10 && day > 14)) {
    jd = 367 * year -
        7 * (year + (month + 9) ~/ 12) ~/ 4 -
        3 * ((year + (month - 9) / 7) ~/ 100 + 1) ~/ 4 +
        275 * month ~/ 9 +
        day +
        jdnAt0amOn1Dec1BcUt;
  } else {
    jd = 367 * year -
        7 * (year + 5001 + ((month - 9) / 7)).toInt() ~/ 4 +
        275 * month ~/ 9 +
        day +
        jdnAt0amOn14Nov23Ut;
  }
  return jd;
}
