import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../mock/bio/hinh.dart';

void main() {
  test('should navigate tuan of Hinh 2,3', () {
    final triet = navigateTriet(hinh);
    print(triet);
    expect(triet.first.toInt(), 2);
  });
}
