import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

void main() {
  test('should create a Star', () {
    final star = Star(
      name: StarName.tuVi,
      position: HousePosition.unknown(),
      info: StarInfo.fromMap(
        basicStarInfo[StarName.tuVi.name]!,
      ),
    );
    expect(star.name.name, 'tuVi');
    expect(star.info.isMajor, true);
  });
}
