extension ScaleToRangeExtension on int {
  int scaleToRange(int min, int max) {
    if (!(this < min || this > max)) {
      return this;
    }

    if (this > max) {
      return _scaleWhenGreaterThanMax(this, min, max);
    } else {
      return _scaleWhenLessThanMin(this, min, max);
    }
  }

  int _scaleWhenGreaterThanMax(int value, int min, int max) {
    final delta = max - min + 1;
    final n = ((value - max) / delta).ceil();
    return value - n * delta;
  }

  int _scaleWhenLessThanMin(int value, int min, int max) {
    final delta = max - min + 1;
    final n = ((min - value) / delta).ceil();
    return value + n * delta;
  }
}
