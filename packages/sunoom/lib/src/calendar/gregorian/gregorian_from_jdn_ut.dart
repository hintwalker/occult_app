part of sunoom;

GregorianDate gregorianFromJdnUt(double jdn) {
  int a, alpha, c, e, dd, mm, yyyy;

  int z = (jdn + 0.5).toInt();
  double f = jdn + 0.5 - z;
  if (z < 2299161) {
    a = z;
  } else {
    alpha = (z - 1867216.25) ~/ 36524.25;
    a = z + 1 + alpha - (alpha ~/ 4);
  }
  int b = a + 1524;
  c = (b - 122.1) ~/ 365.25;
  int d = (365.25 * c).toInt();
  e = (b - d) ~/ 30.6001;
  dd = (b - d - (30.6001 * e).toInt() + f).toInt();
  if (e < 14) {
    mm = e - 1;
  } else {
    mm = e - 13;
  }
  if (mm < 3) {
    yyyy = c - 4715;
  } else {
    yyyy = c - 4716;
  }
  return GregorianDate(
      year: yyyy, month: mm, day: dd, timeZone: TimeZone(offsetInHour: 0));
}
