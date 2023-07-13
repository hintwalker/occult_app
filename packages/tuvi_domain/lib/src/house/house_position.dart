import 'package:sunoom/sunoom.dart';
import 'fit_to_house_position.dart';

class HousePosition {
  final Chi chi;
  const HousePosition(this.chi);

  factory HousePosition.unknown() => HousePosition.fromIndex(-1);
  factory HousePosition.tys() => HousePosition.fromIndex(Chies.tys.index);
  factory HousePosition.suu() => HousePosition.fromIndex(Chies.suu.index);
  factory HousePosition.dan() => HousePosition.fromIndex(Chies.dan.index);
  factory HousePosition.mao() => HousePosition.fromIndex(Chies.mao.index);
  factory HousePosition.thin() => HousePosition.fromIndex(Chies.thin.index);
  factory HousePosition.tyj() => HousePosition.fromIndex(Chies.tyj.index);
  factory HousePosition.ngo() => HousePosition.fromIndex(Chies.ngo.index);
  factory HousePosition.mui() => HousePosition.fromIndex(Chies.mui.index);
  factory HousePosition.than() => HousePosition.fromIndex(Chies.than.index);
  factory HousePosition.dau() => HousePosition.fromIndex(Chies.dau.index);
  factory HousePosition.tuat() => HousePosition.fromIndex(Chies.tuat.index);
  factory HousePosition.hoi() => HousePosition.fromIndex(Chies.hoi.index);

  static Iterable<HousePosition> all() {
    return [
      HousePosition.tys(),
      HousePosition.suu(),
      HousePosition.dan(),
      HousePosition.mao(),
      HousePosition.thin(),
      HousePosition.tyj(),
      HousePosition.ngo(),
      HousePosition.mui(),
      HousePosition.than(),
      HousePosition.dau(),
      HousePosition.tuat(),
      HousePosition.hoi(),
    ];
  }

  @override
  String toString() {
    return chi.name;
  }

  int toInt() {
    return chi.index;
  }

  NguHanh get nguHanh {
    final data = [
      NguHanhs.thuy,
      NguHanhs.tho,
      NguHanhs.moc,
      NguHanhs.moc,
      NguHanhs.tho,
      NguHanhs.hoa,
      NguHanhs.hoa,
      NguHanhs.tho,
      NguHanhs.kim,
      NguHanhs.kim,
      NguHanhs.tho,
      NguHanhs.thuy
    ];
    final index = data[chi.index].index;
    return NguHanh.fromIndex(index);
  }

  factory HousePosition.fromIndex(int position) {
    final chiOfthisPos = Chi.fromIndex(position);
    return HousePosition(chiOfthisPos);
  }

  HousePosition nextClockWise([int delta = 1]) {
    final nextIndex = chi.index + delta;
    return HousePosition.fromIndex(nextIndex.fitToHousePosition());
  }

  HousePosition nextCounterClockWise([int delta = 1]) {
    final nextIndex = chi.index - delta;
    return HousePosition.fromIndex(nextIndex.fitToHousePosition());
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other.runtimeType == runtimeType &&
          other is HousePosition &&
          other.chi.name == chi.name;

  @override
  int get hashCode => chi.name.hashCode;
}
