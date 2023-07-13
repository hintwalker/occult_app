import '../utils/scale_to_range.dart';

extension FitToMonthValueExtension on int {
  int fitMonthValue() => scaleToRange(1, 12);
  // bool _isRightAlready() {
  //   return !(this < 0 || this > 12);
  // }

  // int _fix() {
  //   if (this == 0) {
  //     return 12;
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
