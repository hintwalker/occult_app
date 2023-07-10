import 'am_duong_enum.dart';
import 'am_duong_parts.dart';

class AmDuong {
  final int index;
  final String name;
  const AmDuong({
    required this.index,
    required this.name,
  });
  factory AmDuong.unknown() => AmDuong.fromEnum(AmDuongs.unknown);
  factory AmDuong.am() => AmDuong.fromEnum(AmDuongs.am);
  factory AmDuong.duong() => AmDuong.fromEnum(AmDuongs.duong);

  factory AmDuong.fromEnum(AmDuongs amDuong) {
    return AmDuong.fromIndex(amDuong.index);
  }

  factory AmDuong.fromIndex(int index) {
    final data = amDuongData[index]!;
    return AmDuong.fromMap(data);
  }

  factory AmDuong.fromMap(Map<String, Object> map) {
    return AmDuong(
      index: map['index'] as int,
      name: map['name'] as String,
    );
  }
}
