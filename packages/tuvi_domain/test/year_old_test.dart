import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

void main() {
  test('should calculate year old', () {
    final yearold = yearOld(
      birthday: Moment.fromLuniSolar(
          date: LuniSolarDate(
            year: 1987,
            month: 10,
            day: 17,
            timeZone: TimeZone(offsetInHour: 7),
          ),
          time: SimpleTime(hour: 14, minute: 45)),
      now: Moment.fromLuniSolar(
          date: LuniSolarDate(
            year: 1988,
            month: 10,
            day: 16,
            timeZone: TimeZone(offsetInHour: 7),
          ),
          time: SimpleTime(hour: 14, minute: 45)),
    );
    expect(yearold, 1);
  });
}
