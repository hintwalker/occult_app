part of tuvi_domain;

int findMonthlyTerm({
  required HousePosition position,
  required Chi chiOfBornTime,
  required int bornMonth,
  required Chi yearlyTermOfWatchingYear,
}) {
  final startPos =
      yearlyTermOfWatchingYear.index - (bornMonth - 1) + chiOfBornTime.index;
  final index = (position.toInt() - startPos.toInt() + 1).fitToHousePosition();
  return index + 1;
}

Map<HousePosition, int> findListMonthlyTerm({
  required Chi chiOfBornTime,
  required int bornMonth,
  required Chi yearlyTermOfWatchingYear,
}) {
  final Map<HousePosition, int> result = {};
  for (var position in HousePosition.all()) {
    result[position] = findMonthlyTerm(
        position: position,
        chiOfBornTime: chiOfBornTime,
        bornMonth: bornMonth,
        yearlyTermOfWatchingYear: yearlyTermOfWatchingYear);
  }
  return result;
}
