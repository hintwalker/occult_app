import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

void main() {
  test('should find decade term for specify position', () {
    final menhPosition = HousePosition.thin();
    final cuc = Cuc.hoa6Cuc();
    final dnan = false;
    final decadeThin = findDecadeTerm(
        position: HousePosition.thin(),
        menhPosition: menhPosition,
        cuc: cuc,
        dnan: dnan);
    final decadeNgo = findDecadeTerm(
      position: HousePosition.ngo(),
      menhPosition: menhPosition,
      cuc: cuc,
      dnan: dnan,
    );
    final decadeSuu = findDecadeTerm(
      position: HousePosition.suu(),
      menhPosition: menhPosition,
      cuc: cuc,
      dnan: dnan,
    );
    expect(decadeThin, 6);
    expect(decadeNgo, 106);
    expect(decadeSuu, 36);
  });

  test('should find decade term when dnan', () {
    final menhPosition = HousePosition.suu();
    final cuc = Cuc.moc3Cuc();
    final dnan = true;
    final decadeSuu = findDecadeTerm(
        position: HousePosition.suu(),
        menhPosition: menhPosition,
        cuc: cuc,
        dnan: dnan);
    final decadeThin = findDecadeTerm(
        position: HousePosition.thin(),
        menhPosition: menhPosition,
        cuc: cuc,
        dnan: dnan);
    final decadeThan = findDecadeTerm(
        position: HousePosition.than(),
        menhPosition: menhPosition,
        cuc: cuc,
        dnan: dnan);
    expect(decadeSuu, 3);
    expect(decadeThin, 33);
    expect(decadeThan, 73);
  });
}
