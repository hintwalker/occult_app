import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';

void main() {
  late TimeZone timeZone;
  setUpAll(() {
    timeZone = TimeZone(offsetInHour: 7);
  });
  test('should get 31 dates in 3/2023', () {
    final dates = getDatesInAMonth(2023, 3, timeZone);
    for (final date in dates) {
      print(date);
      final luni = gregorian2LuniSolar(
        gregorian: date.gregorian,
        time: SimpleTime(),
      );
      print(luni);
    }

    expect(dates.length, 31);
  });
}
