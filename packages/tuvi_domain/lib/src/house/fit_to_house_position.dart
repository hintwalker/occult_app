import '../utils/scale_to_range.dart';

extension FitToHousePosition on int {
  int fitToHousePosition() => scaleToRange(0, 11);
  // {

  // if (_isRightAlready()) {
  //   return this;
  // }
  // return _fix();
  // }

  // bool _isRightAlready() {
  //   return !(this < 0 || this > 11);
  // }

  // int _fix() {
  //   if (this == 0) {
  //     return this;
  //   }
  //   if (this < 0) {
  //     final k = (this / 12.0).ceil().abs();
  //     final m = this + (k + 1) * 12;
  //     return _fixGreaterThan0(m);
  //   }
  //   return _fixGreaterThan0(this);
  //   // final k = (this / 12.0).floor().abs();
  //   // return this - k * 12;
  // }

  // int _fixGreaterThan0(int value) {
  //   final k = (value / 12.0).floor().abs();
  //   return value - k * 12;
  // }
}
