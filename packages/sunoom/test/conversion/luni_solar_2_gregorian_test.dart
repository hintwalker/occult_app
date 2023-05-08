import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';

void main() {
  test('should covert from ', () {
    final luniSolar = LuniSolarDate(
      year: 1987,
      month: 10,
      day: 17,
      timeZone: TimeZone(
        offsetInHour: 7,
      ),
    );
    final gregorian = luniSolar2Gregorian(luniSolar);
    print(gregorian);
    expect(gregorian.year, 1987);
  });
}
