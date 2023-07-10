class StarBrightness {
  final String name;
  final String short;
  const StarBrightness(this.name, this.short);
  factory StarBrightness.mieu() => StarBrightness('mieu', 'M');
  factory StarBrightness.vuong() => StarBrightness('vuong', 'V');
  factory StarBrightness.dac() => StarBrightness('dac', 'Đ');
  factory StarBrightness.loi() => StarBrightness('loi', 'L');
  factory StarBrightness.binh() => StarBrightness('binh', 'B');
  factory StarBrightness.khongDac() => StarBrightness('khongDac', 'K');
  factory StarBrightness.ham() => StarBrightness('ham', 'H');
  factory StarBrightness.unknown() => StarBrightness('-', '-');

  factory StarBrightness.fromString(String name) {
    switch (name) {
      case 'mieu':
        return StarBrightness.mieu();
      case 'vuong':
        return StarBrightness.vuong();
      case 'dac':
        return StarBrightness.dac();
      case 'loi':
        return StarBrightness.loi();
      case 'binh':
        return StarBrightness.binh();
      case 'khongDac':
        return StarBrightness.khongDac();
      case 'ham':
        return StarBrightness.ham();
      default:
        return StarBrightness.unknown();
    }
  }
  @override
  String toString() {
    return name;
  }
}
