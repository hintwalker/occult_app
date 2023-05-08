part of tuvi_domain;

Chi findYearlyTerm(HousePosition position, Chi chiOfBornYear, Gender gender) {
  final data = [10, 7, 4, 1, 10, 7, 4, 1, 10, 7, 4, 1];
  final k = gender == Gender.male ? 1 : -1;
  final startPos = data[chiOfBornYear.index];
  final delta = position.toInt() - startPos;
  final intValue = (chiOfBornYear.index + k * delta).fitToHousePosition();
  return Chi.fromIndex(intValue);
}

Map<HousePosition, Chi> findListYearlyTerm(Chi chiOfBornYear, Gender gender) {
  final Map<HousePosition, Chi> result = {};
  for (var position in HousePosition.all()) {
    result[position] = findYearlyTerm(position, chiOfBornYear, gender);
  }
  return result;
}
