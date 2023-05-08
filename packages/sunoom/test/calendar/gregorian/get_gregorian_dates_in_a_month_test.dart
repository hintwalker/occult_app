import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';

void main() {
  late TimeZone timeZone;
  setUpAll(() {
    timeZone = TimeZone(offsetInHour: 7);
  });
  test('should get 31 days in 3/2023', () {
    final dates = getGregorianDatesInAMonth(2023, 3, timeZone);
    for (var date in dates) {
      print(date.toString());
    }
    expect(dates.length, 31);
  });
  test('should get 30 days in 4/2023', () {
    final dates = getGregorianDatesInAMonth(2023, 4, timeZone);
    for (var date in dates) {
      print(date.toString());
    }
    expect(dates.length, 30);
  });
  test('should get 28 days in 2/2023', () {
    final dates = getGregorianDatesInAMonth(2023, 2, timeZone);
    for (var date in dates) {
      print(date.toString());
    }
    expect(dates.length, 28);
  });

  test('should get 29 days in 2/2020', () {
    final dates = getGregorianDatesInAMonth(2020, 2, timeZone);
    for (var date in dates) {
      print(date.toString());
    }
    expect(dates.length, 29);
  });
}
