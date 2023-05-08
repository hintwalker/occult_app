import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../mock/bio/hinh.dart';
import '../mock/bio/tuan_tuong.dart';

void main() {
  test('should navigate house Menh Hinh -> thin', () {
    final housePosition = navigateMenh(hinh);
    expect(housePosition.toInt(), HousePosition.thin().toInt());
  });

  test('should navigate house Menh tuanTuong -> tyj', () {
    final housePosition = navigateMenh(tuanTuong);
    expect(housePosition.toInt(), HousePosition.tyj().toInt());
  });
}
