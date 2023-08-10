import 'package:tauari_date_format/tauari_date_format.dart';
import 'package:test/test.dart';

void main() {
  test('should display date time', () {
    final string = formatGregorianDateTimeVn(
        year: 2023, month: 8, day: 6, hour: 20, minute: 12, second: 3);
    print(string);
  });
}
