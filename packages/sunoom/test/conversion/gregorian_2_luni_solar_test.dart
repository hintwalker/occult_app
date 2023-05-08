import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';

void main() {
  test('should convert from 7/12/1987 14:45 (7) to 17/10/1987', () {
    final gregorian = GregorianDate(
      year: 1987,
      month: 12,
      day: 7,
      timeZone: TimeZone(offsetInHour: 7),
    );
    final luniSolar = gregorian2LuniSolar(
        gregorian: gregorian,
        time: SimpleTime(
          hour: 14,
          minute: 45,
        ));
    print(luniSolar.toString());
    expect(luniSolar.year, 1987);
  });

  test('should convert from 27/3/2023 14:45 (7) to 6/2/2023', () {
    final gregorian = GregorianDate(
      year: 2023,
      month: 3,
      day: 27,
      timeZone: TimeZone(offsetInHour: 7),
    );
    final luniSolar = gregorian2LuniSolar(
        gregorian: gregorian,
        time: SimpleTime(
          hour: 14,
          minute: 45,
        ));
    print(luniSolar.toString());
    expect(luniSolar.year, 2023);
    expect(luniSolar.month, 2);
    expect(luniSolar.day, 6);
  });

  test('should convert from 27/3/2023 23:45 (7) to 7/2/2023', () {
    final gregorian = GregorianDate(
      year: 2023,
      month: 3,
      day: 27,
      timeZone: TimeZone(offsetInHour: 7),
    );
    final luniSolar = gregorian2LuniSolar(
        gregorian: gregorian,
        time: SimpleTime(
          hour: 23,
          minute: 45,
        ));
    print(luniSolar.toString());
    expect(luniSolar.year, 2023);
    expect(luniSolar.month, 2);
    expect(luniSolar.day, 7);
  });

  test('should convert from 27/5/1995 23:45 (7) to 29/4/1995', () {
    final gregorian = GregorianDate(
      year: 1995,
      month: 5,
      day: 27,
      timeZone: TimeZone(offsetInHour: 7),
    );
    final luniSolar = gregorian2LuniSolar(
        gregorian: gregorian,
        time: SimpleTime(
          hour: 23,
          minute: 45,
        ));
    print(luniSolar.toString());
    expect(luniSolar.year, 1995);
    expect(luniSolar.month, 4);
    expect(luniSolar.day, 29);
  });
}
