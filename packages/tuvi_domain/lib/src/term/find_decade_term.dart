part of tuvi_domain;

int findDecadeTerm(
    {required HousePosition position,
    required HousePosition menhPosition,
    required Cuc cuc,
    required bool dnan}) {
  // final k = dnan ? 1 : -1;
  // final pos =
  //     (position.toInt() * k + menhPosition.toInt()).fitToHousePosition();
  final hieu = position.toInt() - menhPosition.toInt();
  if (dnan) {
    if (hieu < 0) {
      return 120 - hieu.abs() * 10 + cuc.value;
    } else {
      return cuc.value + hieu * 10;
    }
  } else {
    if (hieu > 0) {
      return 120 - hieu * 10 + cuc.value;
    } else {
      return cuc.value + hieu.abs() * 10;
    }
  }
}

Map<HousePosition, int> findListDecadeTerm({
  required HousePosition menhPosition,
  required bool dnan,
  required Cuc cuc,
}) {
  final Map<HousePosition, int> result = {};
  for (var position in HousePosition.all()) {
    result[position] = findDecadeTerm(
      position: position,
      menhPosition: menhPosition,
      dnan: dnan,
      cuc: cuc,
    );
  }
  return result;
}
