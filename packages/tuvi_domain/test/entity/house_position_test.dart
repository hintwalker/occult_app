import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

void main() {
  test('should create a house position from method', () {
    final position = HousePosition.tys();
    expect(position.toInt(), 0);
  });
  test('should create a house position from int', () {
    final position = HousePosition.fromIndex(0);
    expect(position.toString(), 'tys');
    expect(position.toInt(), 0);
  });
}
