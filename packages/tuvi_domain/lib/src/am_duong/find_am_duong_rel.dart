import 'package:sunoom/sunoom.dart';

import 'am_duong_rel.dart';

AmDuongRel findAmDuongRel(int posOfMenh, Chi chiOfBornYear) {
  final rPos = posOfMenh % 2;
  final rChi = chiOfBornYear.index % 2;
  if ((rPos == 0 && rChi == 0) || (rPos != 0 && rChi != 0)) {
    return AmDuongRel.amDuongThuanLy;
  }
  return AmDuongRel.amDuongNghichLy;
}
