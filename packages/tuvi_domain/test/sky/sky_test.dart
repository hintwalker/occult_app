import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../mock/sky/sky_mock.dart';

void main() {
  test('should get a sky', () {
    final sky = skyMock;
    expect(sky.stars.length, 128);
    expect(sky.stars[StarName.tuVi]?.info.isMajor, true);
    expect(sky.stars[StarName.tuVi]?.info.nguHanh.name, 'duong_tho');
  });
}
