import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../mock/bio/hinh.dart';

void main() {
  test('should navigate tuan of Hinh 10,11', () {
    final tuan = navigateTuan(hinh);
    print(tuan);
    expect(tuan.first.toInt(), 10);
  });
}
