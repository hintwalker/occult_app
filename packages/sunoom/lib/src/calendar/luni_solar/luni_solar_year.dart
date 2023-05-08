part of sunoom;

class LuniSolarYear {
  final List<LuniSolarMonth> months;
  final int leapMonthIndex;
  final TimeZone timeZone;
  LuniSolarYear(this.months, this.leapMonthIndex, this.timeZone);

  int countMonth() => months.length;

  LuniSolarMonth? leapMonth() {
    if (leapMonthIndex < 0 || leapMonthIndex >= countMonth()) {
      return null;
    } else {
      return months[leapMonthIndex];
    }
  }

  bool isLeap() => countMonth() == 14;

  LuniSolarMonth monthOfDate(LuniSolarDate date) {
    try {
      final result = months.firstWhere((month) =>
          month.value == date.month && month.isLeap == date.isLeapMonth);
      return result;
    } catch (e) {
      throw LuniSolarMonthNotFound('Not found: $date');
    }
  }

  factory LuniSolarYear.fromGregorianYear(
      int gregorianYear, TimeZone timeZone) {
    final pairOfJdn =
        PairOfFirstJdnNov.getPairOfFirstJdn(gregorianYear, timeZone);
    final countDays = pairOfJdn.current - pairOfJdn.previous;
    var countMonths = 13;
    if (countDays > 365) {
      countMonths = 14;
    }
    final List<LuniSolarMonth> months = [];
    final listOfJdnNov = firstJdnPerMonthList(countMonths, pairOfJdn, timeZone);
    listOfJdnNov.asMap().forEach((index, jdn) {
      months.add(LuniSolarMonth(
          index,
          LuniSolarMonthList.monthValueFromIndex(index),
          Moment.fromJdnLocal(jdn, timeZone),
          false,
          jdn));
    });
    var leapMonthIndex = -1;
    if (countMonths == 14) {
      var foundLeapMonth = false;
      for (var i = 0; i < 14; i++) {
        if (foundLeapMonth) {
          months[i] = months[i].copy(value: _modifyMonthValueAfterLeapFound(i));
        } else {
          if (i < 13) {
            final sunLong = sunLongitudeFromJdn(months[i].jdnOnFirstDay);
            final nextSunLong =
                sunLongitudeFromJdn(months[i + 1].jdnOnFirstDay);
            final isMajorInside = isMajorTermInside(nextSunLong, sunLong);
            if (!isMajorInside) {
              foundLeapMonth = true;
              months[i] = months[i].copy(
                  value: _modifyMonthValueAfterLeapFound(i), isLeap: true);
              leapMonthIndex = i;
            }
          }
        }
      }
    }
    return LuniSolarYear(months, leapMonthIndex, timeZone);
  }

  static int _modifyMonthValueAfterLeapFound(int index) {
    return mod(index + 10, 12);
  }

  static bool isYearLeap(int year) {
    return [0, 3, 6, 9, 11, 14, 17].contains(year % 19);
  }
}
