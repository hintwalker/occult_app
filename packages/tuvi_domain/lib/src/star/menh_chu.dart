import '../star/star_name.dart';

import '../house/house_position.dart';

StarName menhChu(HousePosition posOfMenh) {
  final data = [
    StarName.thamLang,
    StarName.cuMon,
    StarName.locTon,
    StarName.vanKhuc,
    StarName.liemTrinh,
    StarName.vuKhuc,
    StarName.phaQuan,
    StarName.vuKhuc,
    StarName.liemTrinh,
    StarName.vanKhuc,
    StarName.locTon,
    StarName.cuMon,
  ];
  return data[posOfMenh.toInt()];
}
