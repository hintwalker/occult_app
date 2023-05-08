import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';

void main() {
  test('should compare thuy ti hoa thuy', () {
    final thuy = NguHanh.fromIndex(NguHanhs.thuy.index);
    final thuy2 = NguHanh.fromIndex(NguHanhs.thuy.index);
    final result = thuy.compareTo(thuy2);
    expect(result.name, 'ti_hoa');
  });
}
