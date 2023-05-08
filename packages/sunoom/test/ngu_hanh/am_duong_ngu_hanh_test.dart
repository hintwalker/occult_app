import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';

void main() {
  test('should create am duong ngu hanh by string', () {
    final amDuongNguHanh = AmDuongNguHanh.fromString('am_thuyDoiTho');
    print(amDuongNguHanh);
    expect(amDuongNguHanh.nguHanh.name, 'thuyDoiTho');
  });
}
