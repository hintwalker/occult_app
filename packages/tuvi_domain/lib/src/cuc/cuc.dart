part of tuvi_domain;

@freezed
abstract class Cuc with _$Cuc {
  const Cuc._();
  const factory Cuc.unknown() = UnknownCuc;
  const factory Cuc.thuy2Cuc() = Thuy2Cuc;
  const factory Cuc.moc3Cuc() = Moc3Cuc;
  const factory Cuc.kim4Cuc() = Kim4Cuc;
  const factory Cuc.tho5Cuc() = Tho5Cuc;
  const factory Cuc.hoa6Cuc() = Hoa6Cuc;

  int get value {
    return when(
      unknown: () => -1,
      thuy2Cuc: () => 2,
      moc3Cuc: () => 3,
      kim4Cuc: () => 4,
      tho5Cuc: () => 5,
      hoa6Cuc: () => 6,
    );
  }

  int get index {
    return when(
      unknown: () => -1,
      thuy2Cuc: () => 0,
      moc3Cuc: () => 1,
      kim4Cuc: () => 2,
      tho5Cuc: () => 3,
      hoa6Cuc: () => 4,
    );
  }

  String get name => toString();

  @override
  String toString() {
    return when(
      unknown: () => '-',
      thuy2Cuc: () => 'thuyNhiCuc',
      moc3Cuc: () => 'mocTamCuc',
      kim4Cuc: () => 'kimTuCuc',
      tho5Cuc: () => 'thoNguCuc',
      hoa6Cuc: () => 'hoaLucCuc',
    );
  }

  factory Cuc.fromValue(int value) {
    switch (value) {
      case 2:
        return Cuc.thuy2Cuc();
      case 3:
        return Cuc.moc3Cuc();
      case 4:
        return Cuc.kim4Cuc();
      case 5:
        return Cuc.tho5Cuc();
      case 6:
        return Cuc.hoa6Cuc();
      default:
        return Cuc.unknown();
    }
  }

  factory Cuc.from({
    required int canOfYearIndex,
    // required int chiOfYearIndex,
    required int posOfMenh,
  }) {
    final data = [
      [2, 6, 5, 3, 4],
      [6, 5, 3, 4, 2],
      [3, 4, 2, 6, 5],
      [5, 3, 4, 2, 6],
      [4, 2, 6, 5, 3]
    ];
    int row;
    if (posOfMenh == 10 || posOfMenh == 11) {
      row = 1;
    } else {
      row = posOfMenh ~/ 2;
    }
    final col = canOfYearIndex % 5;
    final value = data[row][col];
    return Cuc.fromValue(value);
  }
}
