part of sunoom;

extension IsNextLuniSolarDay on Moment {
  bool isNextLuniDay() {
    return time.hour >= 23;
  }
}
