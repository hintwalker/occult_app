import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

void main() {
  test('should create a Cuc', () {
    final cuc = Cuc.hoa6Cuc();
    expect(cuc.value, 6);
  });

  test('should create a Cuc from can, chi, posOfMenh', () {
    final cuc = Cuc.from(canOfYearIndex: 3, posOfMenh: 4);
    expect(cuc, Cuc.hoa6Cuc());
  });
}
