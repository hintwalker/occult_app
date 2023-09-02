import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

class ElementColors {
  static const Color selectedAsSource = Color(0x33eece62);
  static const Color selectedAsOther = Color(0x1500a0b0);
  static const Color fire = Color(0xffcc2a36);
  static const Color wood = Color(0xff1c8923);
  static const Color earth = Color.fromARGB(255, 253, 188, 24);
  static const Color water = Color(0xff000000);
  static const Color metal = Color(0xff9ea7aa);

  static final data = {
    NguHanhs.hoa.index: fire,
    NguHanhs.kim.index: metal,
    NguHanhs.moc.index: wood,
    NguHanhs.thuy.index: water,
    NguHanhs.tho.index: earth,
    NguHanhs.hoaDoiKim.index: fire,
    NguHanhs.hoaDoiMoc.index: fire,
    NguHanhs.hoaDoiTho.index: fire,
    NguHanhs.hoaDoiThuy.index: fire,
    NguHanhs.kimDoiHoa.index: metal,
    NguHanhs.kimDoiMoc.index: metal,
    NguHanhs.kimDoiTho.index: metal,
    NguHanhs.kimDoiThuy.index: metal,
    NguHanhs.mocDoiHoa.index: wood,
    NguHanhs.mocDoiKim.index: wood,
    NguHanhs.mocDoiTho.index: wood,
    NguHanhs.mocDoiThuy.index: wood,
    NguHanhs.thuyDoiHoa.index: water,
    NguHanhs.thuyDoiKim.index: water,
    NguHanhs.thuyDoiMoc.index: water,
    NguHanhs.thuyDoiTho.index: water,
    NguHanhs.thoDoiHoa.index: earth,
    NguHanhs.thoDoiKim.index: earth,
    NguHanhs.thoDoiMoc.index: earth,
    NguHanhs.thoDoiThuy.index: earth
  };

  static Color ofNguHanh(NguHanh value) {
    if (value.index == -1) {
      return Colors.blue;
    }
    return data[value.index]!;
  }
}
