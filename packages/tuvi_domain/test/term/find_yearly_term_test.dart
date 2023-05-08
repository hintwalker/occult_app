import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

void main() {
  test('should find yearly term for male', () {
    final chiOfBornYear = Chi.fromEnum(Chies.mao);
    final yearlyMao = findYearlyTerm(
      HousePosition.mao(),
      chiOfBornYear,
      Gender.male,
    );
    final yearlyThan = findYearlyTerm(
      HousePosition.than(),
      chiOfBornYear,
      Gender.male,
    );
    final yearlyTys = findYearlyTerm(
      HousePosition.tys(),
      chiOfBornYear,
      Gender.male,
    );
    expect(yearlyMao, Chi.fromEnum(Chies.tyj));
    expect(yearlyThan, Chi.fromEnum(Chies.tuat));
    expect(yearlyTys, Chi.fromEnum(Chies.dan));
  });

  test('should find yearly term for female', () {
    final chiOfBornYear = Chi.fromEnum(Chies.mao);
    final yearlyMao = findYearlyTerm(
      HousePosition.mao(),
      chiOfBornYear,
      Gender.female,
    );
    final yearlyThan = findYearlyTerm(
      HousePosition.than(),
      chiOfBornYear,
      Gender.female,
    );
    final yearlyTys = findYearlyTerm(
      HousePosition.tys(),
      chiOfBornYear,
      Gender.female,
    );
    expect(yearlyMao, Chi.fromEnum(Chies.suu));
    expect(yearlyThan, Chi.fromEnum(Chies.than));
    expect(yearlyTys, Chi.fromEnum(Chies.thin));
  });
}
