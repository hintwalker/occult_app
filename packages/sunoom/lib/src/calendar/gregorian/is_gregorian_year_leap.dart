part of sunoom;

bool isGregorianYearLeap(int year) {
  // (y % 16 == 0) matches multiples of 400, and is faster than % 400.
  return (year % 4 == 0) && ((year % 16 == 0) || (year % 100 != 0));
}
