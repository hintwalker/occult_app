import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../mock/bio/hinh.dart';

void main() {
  test('should navigate phumau next to menh', () {
    final menh = navigateMenh(hinh);
    final phuMau = navigateOtherHouse(HouseName.phuMau, menh);
    expect(phuMau.toInt(), HousePosition.tyj().toInt());
  });
  test('should navigate all houses', () {
    final menh = navigateMenh(hinh);
    navigateListHouse(menh);
  });
}
