import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';

void main() {
  test('should get tomorrow', () {
    final now = DateTime.now();
    final gregorian = GregorianDate.fromDateTime(
      dateTime: now,
      timeZone: TimeZone(
        offsetInHour: 7,
      ),
    );

    final tomorrow = Moment.fromGregorian(gregorian).tomorrow().gregorian;
    print(tomorrow);
    expect(tomorrow.day, 1);
  });
}
