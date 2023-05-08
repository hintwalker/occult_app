import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

void main() {
  test('should get a sky', () {
    final sky = Sky(SkyConfig.tranDoan());
    expect(sky.stars.length, 118);
    expect(sky.stars[StarName.tuVi]?.info.isMajor, true);
    expect(sky.stars[StarName.tuVi]?.info.nguHanh.name, 'duong_tho');
  });
}
