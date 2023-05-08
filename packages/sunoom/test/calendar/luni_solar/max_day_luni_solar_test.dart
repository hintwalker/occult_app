import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';

void main() {
  test('should get 29 days in 4/1994', () {
    final maxDay = countDaysInLuniSolarMonth(1995, 4, false, 7);
    expect(maxDay, 29);
  });
}
