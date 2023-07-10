import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

void main() {
  test('hinh - 2023, month jan at house hoi', () {
    final index = findMonthlyTerm(
      position: HousePosition.hoi(),
      chiOfBornTime: Chi.fromEnum(Chies.mui),
      bornMonth: 10,
      yearlyTermOfWatchingYear: Chi.fromEnum(Chies.mao),
    );
    expect(index, 1);
  });
}
