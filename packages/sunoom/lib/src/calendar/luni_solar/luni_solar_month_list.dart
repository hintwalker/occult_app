part of sunoom;

class LuniSolarMonthList {
  final List<LuniSolarMonth> months;
  final int leapMonthIndex;
  LuniSolarMonthList(this.months, this.leapMonthIndex);

  factory LuniSolarMonthList.fromJdnNovs(List<double> firstJdnPerMonth,
      PairOfFirstJdnNov pairOfFirstJdnNov, TimeZone timeZone) {
    List<LuniSolarMonth> months =
        _fillMonths(firstJdnPerMonth, pairOfFirstJdnNov, timeZone);
    int leapMonthIndex = findLeapMonthIndex(months, firstJdnPerMonth);
    if (leapMonthIndex == -2) {
      leapMonthIndex = 11;
      final nextJdnNov =
          nextFirstJdnNovOfLeapYear(firstJdnPerMonth[0], timeZone);
      months = modifyMonthsIfLeap(months, leapMonthIndex);
      months = expandsMonth(months, nextJdnNov, timeZone);
    }
    if (firstJdnPerMonth.length == 14 && leapMonthIndex >= 0) {
      months = modifyMonthsIfLeap(months, leapMonthIndex);
    }
    int resultLeapMonthIndex;
    if (leapMonthIndex == 0) {
      resultLeapMonthIndex = -1;
    } else {
      resultLeapMonthIndex = leapMonthIndex;
    }
    return LuniSolarMonthList(months, resultLeapMonthIndex);
  }

  static List<LuniSolarMonth> _fillMonths(List<double> firstJdnPerMonth,
      PairOfFirstJdnNov pairOfFirstJdnNov, TimeZone timeZone) {
    List<LuniSolarMonth> months = [];
    months.add(_firstMonth(pairOfFirstJdnNov.previous, timeZone));
    final innerMonths = getInnerMonths(firstJdnPerMonth, timeZone);
    months.addAll(innerMonths);
    months.add(firstMonthOfNextYear(
        firstJdnPerMonth.length, pairOfFirstJdnNov.current, timeZone));
    return months;
  }

  static LuniSolarMonth _firstMonth(double jdnPreviousNov, TimeZone timeZone) {
    final firstDateInGregorian = Moment.fromJdnLocal(jdnPreviousNov, timeZone);
    return LuniSolarMonth(0, 11, firstDateInGregorian, false, jdnPreviousNov);
  }

  static List<LuniSolarMonth> getInnerMonths(
      List<double> firstJdnPerMonth, TimeZone timeZone) {
    final List<LuniSolarMonth> result = [];
    for (var index = 1; index < firstJdnPerMonth.length - 1; index++) {
      final firstDateInGregorian =
          Moment.fromJdnLocal(firstJdnPerMonth[index], timeZone);
      final monthValue = monthValueFromIndex(index);
      result.add(LuniSolarMonth(index, monthValue, firstDateInGregorian, false,
          firstJdnPerMonth[index]));
    }
    return result;
  }

  static LuniSolarMonth firstMonthOfNextYear(
      int length, double jdnCurrent, TimeZone timeZone) {
    final firstDateInGregorian = Moment.fromJdnLocal(jdnCurrent, timeZone);
    return LuniSolarMonth(
        length - 1, 11, firstDateInGregorian, false, jdnCurrent);
  }

  static int findLeapMonthIndex(
      List<LuniSolarMonth> months, List<double> firstJdnPerMonths) {
    if (months.length == 13 &&
        !isLuniSolarYearLeap(months[2].firstDate.luniSolarDate.year)) {
      return -1;
    }
    final longitudes = sunLongitudeList(firstJdnPerMonths);
    for (var index = 1; index < months.length; index++) {
      if (LuniSolarMonth.checkIfMonthIsLeap(
          index, longitudes[index], longitudes[index - 1])) {
        if (index == 1) {
          return 0;
        } else {
          return index - 2;
        }
      }
    }
    return -2;
  }

  static List<LuniSolarMonth> expandsMonth(
      List<LuniSolarMonth> months, nextJdnNov, TimeZone timeZone) {
    final List<LuniSolarMonth> result = [];
    result.addAll(months.sublist(0, months.length - 1));
    result.add(LuniSolarMonth(
        13, 11, Moment.fromJdnLocal(nextJdnNov, timeZone), false, nextJdnNov));
    return result;
  }

  static List<LuniSolarMonth> modifyMonthsIfLeap(
      List<LuniSolarMonth> months, int leapMonthIndex) {
    if (leapMonthIndex == 0) {
      return shrinkLeapMonthToNormal(months);
    }
    const List<LuniSolarMonth> result = [];
    final leapMonthValue = monthValueFromIndex(leapMonthIndex);
    result.addAll(months);
    int count = 0;
    final startIndex = leapMonthIndex + 1;
    result[startIndex] = result[startIndex].copy(isLeap: true);
    for (var index = startIndex; index < months.length; index++) {
      result[index] = result[index]
          .copy(value: standardizeMonthValue(leapMonthValue + count));
      count++;
    }
    return result;
  }

  static List<LuniSolarMonth> shrinkLeapMonthToNormal(
      List<LuniSolarMonth> months) {
    final List<LuniSolarMonth> result = [];
    result.addAll(months.sublist(1, months.length));
    result.asMap().forEach((index, month) => {
          result[index] = result[index]
              .copy(index: index, value: standardizeMonthValue(month.value - 1))
        });
    return result;
  }

  static int monthValueFromIndex(int leapMonthIndex) {
    return rightMonthValue((leapMonthIndex + 11) % 12);
  }

  static int standardizeMonthValue(int rawValue) {
    int result;
    if (rawValue > 12) {
      final k = (rawValue / 12).floor();
      result = rightMonthValue(rawValue - k * 12);
    } else {
      result = rightMonthValue(rawValue);
    }
    return result;
  }

  static int rightMonthValue(int rawValue) {
    if (rawValue == 0) {
      return 12;
    } else {
      return rawValue;
    }
  }
}
