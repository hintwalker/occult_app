import '../am_duong/am_duong.dart';
import 'am_duong_ngu_hanh_parts.dart';
import 'ngu_hanh.dart';

class AmDuongNguHanh {
  final int index;
  final AmDuong amDuong;
  final NguHanh nguHanh;
  final String name;
  const AmDuongNguHanh({
    required this.index,
    required this.name,
    required this.amDuong,
    required this.nguHanh,
  });

  const AmDuongNguHanh.initial({
    this.index = -1,
    this.amDuong = const AmDuong.initial(),
    this.nguHanh = const NguHanh.initial(),
    this.name = '',
  });

  factory AmDuongNguHanh.fromIndex(int index) {
    final data = amDuongNguHanhData[index]!;
    return AmDuongNguHanh.fromMap(data);
  }

  factory AmDuongNguHanh.fromMap(Map<String, Object> map) {
    return AmDuongNguHanh(
      index: map['index'] as int,
      name: map['name'] as String,
      amDuong: AmDuong.fromIndex(map['amDuong'] as int),
      nguHanh: NguHanh.fromIndex(map['nguHanh'] as int),
    );
  }

  factory AmDuongNguHanh.fromString(String name) {
    final data = amDuongNguHanhData.entries
        .firstWhere((element) => name == element.value['name'] as String);
    return AmDuongNguHanh.fromMap(data.value);
  }

  factory AmDuongNguHanh.unknown() => AmDuongNguHanh.fromIndex(-1);
  // factory AmDuongNguHanh.duongThuy() = DuongThuy;
  // factory AmDuongNguHanh.amThuy() = AmThuy;
  // factory AmDuongNguHanh.duongMoc() = DuongMoc;
  // factory AmDuongNguHanh.amMoc() = AmMoc;
  // factory AmDuongNguHanh.duongKim() = DuongKim;
  // factory AmDuongNguHanh.amKim() = AmKim;
  // factory AmDuongNguHanh.duongTho() = DuongTho;
  // factory AmDuongNguHanh.amTho() = AmTho;
  // factory AmDuongNguHanh.duongHoa() = DuongHoa;
  // factory AmDuongNguHanh.amHoa() = AmHoa;
}
