part of sunoom;

int countMonthsFrom1Jan1900Ut(double jdn) {
  return (jdn - jdnAt13h50m5269On1Jan1990Ut) ~/ daysPerLunarMonth;
}
