import 'dart:math';

bool isMajorTermInside(double current, double prev) {
  final majorTerms = [
    0.0,
    pi / 6,
    2 * pi / 6,
    3 * pi / 6,
    4 * pi / 6,
    5 * pi / 6,
    pi,
    7 * pi / 6,
    8 * pi / 6,
    9 * pi / 6,
    10 * pi / 6,
    11 * pi / 6
  ];
  bool result = false;
  for (var it in majorTerms) {
    bool delta = false;
    if (current > prev) {
      delta = it >= prev && it < current;
    } else {
      delta = it >= prev || it < current;
    }
    result = result || delta;
  }
  return result;
}
