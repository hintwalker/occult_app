import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';

void main() {
  test('should create moment', () {
    final moment = Moment(
      gregorian: GregorianDate(
        day: 7,
        month: 12,
        year: 1987,
        timeZone: TimeZone(offsetInHour: 7),
      ),
      time: SimpleTime(
        hour: 14,
        minute: 45,
      ),
      timeZone: TimeZone(offsetInHour: 7),
    );
    expect(moment.luniSolarDate.day, 17);
  });
}
