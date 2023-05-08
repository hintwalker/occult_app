import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../mock/bio/hinh.dart';
import '../mock/bio/tuan_tuong.dart';

void main() {
  test('should find Cuc Hinh -> hoa', () {
    final cuc = Cuc.from(
      canOfYearIndex: Can.ofLuniYear(1987).index,
      // chiOfYearIndex: Chi.ofLuniYear(1987).index,
      posOfMenh: navigateMenh(hinh).toInt(),
    );
    print(cuc);
    expect(cuc.index, Cuc.hoa6Cuc().index);
  });
  test('should find Cuc tuanTuong -> kim', () {
    final cuc = Cuc.from(
      canOfYearIndex: Can.ofLuniYear(1965).index,
      // chiOfYearIndex: Chi.ofLuniYear(1965).index,
      posOfMenh: navigateMenh(tuanTuong).toInt(),
    );
    print(cuc);
    expect(cuc.index, Cuc.kim4Cuc().index);
  });

  test('should calculate cuc', () {
    final row = 5 ~/ 2;
    final col = 1 % 5;
    print('row: $row, col: $col');
  });
}
