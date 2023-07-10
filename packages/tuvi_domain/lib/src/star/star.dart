import '../house/house_position.dart';
import 'star_brightness.dart';
import 'star_info.dart';
import 'star_key.dart';
import 'star_name.dart';

class Star {
  final StarName name;
  final HousePosition position;
  final StarInfo info;
  StarBrightness? strength;

  Star({
    required this.name,
    required this.position,
    required this.info,
    this.strength,
  });

  Map<String, dynamic> toMap() => {
        StarKey.name: name.name,
        StarKey.position: position.toInt(),
      };

  factory Star.fromMap(Map<String, dynamic> map) {
    return Star(
      name: StarName.values
          .firstWhere((element) => element.name == map[StarKey.name] as String),
      position: HousePosition.fromIndex(map[StarKey.position] as int),
      info: StarInfo.fromMap(map[StarKey.info]),
    );
  }

  @override
  String toString() {
    return "${name.name} - ${position.toString()}(${strength.toString()})";
  }

  Star copyWith({
    HousePosition? position,
    StarBrightness? strength,
  }) {
    return Star(
      name: name,
      position: position ?? this.position,
      info: info,
      strength: strength ?? this.strength,
    );
  }
}
