import 'package:sunoom/sunoom.dart';

import 'star_brightness.dart';
import 'star_info_key.dart';

class StarInfo {
  final bool isMajor;
  final bool isLife;
  final bool isKiller;
  final bool isLuuNien;
  final bool bold;
  final bool isGood;
  final AmDuongNguHanh nguHanh;
  final Map<int, StarBrightness> brightness;
  const StarInfo({
    required this.isMajor,
    required this.isLife,
    required this.isKiller,
    required this.isGood,
    required this.isLuuNien,
    required this.bold,
    required this.nguHanh,
    required this.brightness,
  });

  factory StarInfo.fromMap(Map<String, Object?> map) {
    return StarInfo(
      isMajor: map[StarInfoKey.isMajor.name] == null
          ? false
          : map[StarInfoKey.isMajor.name] as bool,
      isLife: map[StarInfoKey.isLife.name] == null
          ? false
          : map[StarInfoKey.isLife.name] as bool,
      isGood: map[StarInfoKey.isGood.name] == null
          ? false
          : map[StarInfoKey.isGood.name] as bool,
      isKiller: map[StarInfoKey.isKiller.name] == null
          ? false
          : map[StarInfoKey.isKiller.name] as bool,
      isLuuNien: map[StarInfoKey.isLuuNien.name] == null
          ? false
          : map[StarInfoKey.isLuuNien.name] as bool,
      bold: map[StarInfoKey.bold.name] == null
          ? false
          : map[StarInfoKey.bold.name] as bool,
      nguHanh: map[StarInfoKey.nguHanh.name] == null
          ? AmDuongNguHanh.unknown()
          : AmDuongNguHanh.fromString(map[StarInfoKey.nguHanh.name] as String),
      brightness: map[StarInfoKey.strengths.name] == null
          ? {}
          : (map[StarInfoKey.strengths.name] as Map<int, String>).map(
              (key, value) => MapEntry(
                key,
                StarBrightness.fromString(value),
              ),
            ),
    );
  }

  factory StarInfo.noInfo() => StarInfo(
      isMajor: false,
      isKiller: false,
      isLife: false,
      isGood: false,
      isLuuNien: false,
      bold: false,
      nguHanh: AmDuongNguHanh.unknown(),
      brightness: {});
}
