bool isLuniSolarYearLeap(int year) {
  final data = [0, 3, 6, 9, 11, 14, 17];
  return data.contains(year % 19);
}
