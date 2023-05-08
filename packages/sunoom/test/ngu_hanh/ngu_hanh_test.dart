import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';

void main() {
  test('should get nguHanh from string', () {
    final nguHanh = NguHanh.fromString('thuyDoiMoc');
    print(nguHanh);
    expect(nguHanh.name, 'thuyDoiMoc');
  });
}
