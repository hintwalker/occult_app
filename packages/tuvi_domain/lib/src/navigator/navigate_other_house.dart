import '../house/house_name.dart';
import '../house/house_position.dart';

Map<HousePosition, HouseName> navigateListHouse(HousePosition menhPosition) {
  final Map<HousePosition, HouseName> result = {};
  for (var name in HouseName.values) {
    if (name != HouseName.than && name != HouseName.unknown) {
      final pos = navigateOtherHouse(name, menhPosition);
      result[pos] = name;
    }
  }
  return result;
}

HousePosition navigateOtherHouse(HouseName name, HousePosition menhPosition) {
  return menhPosition.nextClockWise(name.deltaFromMenh);
  // switch (name) {
  //   case HouseName.phuMau:
  //     return menhPosition.nextClockWise();
  //   case HouseName.phucDuc:
  //     return menhPosition.nextClockWise(2);
  //   case HouseName.dienTrach:
  //     return menhPosition.nextClockWise(3);
  //   case HouseName.quanLoc:
  //     return menhPosition.nextClockWise(4);
  //   case HouseName.noBoc:
  //     return menhPosition.nextClockWise(5);
  //   case HouseName.thienDi:
  //     return menhPosition.nextClockWise(6);
  //   case HouseName.tatAch:
  //     return menhPosition.nextClockWise(7);
  //   case HouseName.tuTuc:
  //     return menhPosition.nextClockWise(8);
  //   case HouseName.phuThe:
  //     return menhPosition.nextClockWise(9);
  //   case HouseName.huynhDe:
  //     return menhPosition.nextClockWise(10);
  //   default:
  //     return HousePosition.unknown();
  // }
}
