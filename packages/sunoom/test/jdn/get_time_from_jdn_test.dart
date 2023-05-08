import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';

void main() {
  test('should get time from jdn', () {
    final jdn = 2451602.5833333;
    final date = gregorianFromJdnUt(jdn);
    final jdn0hUt = jdnAt0hUt(date.year, date.month, date.day);
    final hieu = jdn - jdn0hUt;
    print('jdn - jdn0h = $hieu');
    final time = hieu * 24;
    final hour = time.floor();
    final minute = (time - hour) * 60;
    print('hour: $hour, minute: $minute');
    expect(hour, 1);
  });
}
