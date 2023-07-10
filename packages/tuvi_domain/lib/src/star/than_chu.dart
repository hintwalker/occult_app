import 'package:sunoom/sunoom.dart';

import 'star_name.dart';

StarName thanChu(Chi chiOfBornYear) {
  final data = [
    StarName.hoaTinh,
    StarName.thienTuong,
    StarName.thienLuong,
    StarName.thienDong,
    StarName.vanXuong,
    StarName.thienCo,
    StarName.linhTinh,
    StarName.thienTuong,
    StarName.thienLuong,
    StarName.thienDong,
    StarName.vanXuong,
    StarName.thienCo,
  ];
  return data[chiOfBornYear.index];
}
