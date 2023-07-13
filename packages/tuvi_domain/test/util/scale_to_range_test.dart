import 'package:test/test.dart';
import 'package:tuvi_domain/src/utils/scale_to_range.dart';

void main() {
  test('should scale 1 to 1 in range(1,12)', () {
    final value = 1.scaleToRange(1, 12);
    expect(value, 1);
  });
  test('should scale 12 to 12 in range(1,12)', () {
    final value = 12.scaleToRange(1, 12);
    expect(value, 12);
  });
  test('should scale 13 to 1 in range(1,12)', () {
    final value = 13.scaleToRange(1, 12);
    expect(value, 1);
  });
  test('should scale 20 to 8 in range(1,12)', () {
    final value = 20.scaleToRange(1, 12);
    expect(value, 8);
  });
  test('should scale -20 to 4 in range(1,12)', () {
    final value = (-20).scaleToRange(1, 12);
    expect(value, 4);
  });

  test('should scale 20 to 8 in range(0,11)', () {
    final value = 20.scaleToRange(0, 11);
    expect(value, 8);
  });

  test('should scale 12 to 0 in range(0,11)', () {
    final value = 12.scaleToRange(0, 11);
    expect(value, 0);
  });
}
