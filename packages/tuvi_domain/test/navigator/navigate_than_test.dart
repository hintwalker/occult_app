import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../mock/bio/hinh.dart';

void main() {
  test('should navigate house Than', () {
    final housePosition = navigateThan(hinh);
    expect(housePosition.toInt(), HousePosition.ngo().toInt());
  });
}
