import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';
import '../mock/bio/bi.dart';
import '../mock/bio/hinh.dart';
import '../mock/bio/tuan_tuong.dart';
import '../mock/sky/sky_mock.dart';
import '../mock/star/star_iterator_mock.dart';

void main() {
  test('should navigate stars hinh', () {
    // testNavigate(hinh, SkyConfig.basicOptions);
    final otherConfig = SkyConfig.basicOptions;
    otherConfig[StarFormulaKey.showAmSat.name] = 1;
    testNavigate(hinh, otherConfig);
  });

  test('should navigate stars bi', () {
    testNavigate(bi, SkyConfig.basicOptions);
  });

  test('should navigate stars tuanTuong', () {
    testNavigate(tuanTuong, SkyConfig.basicOptions);
  });
}

void testNavigate(HumanBio humanBio, Map<String, dynamic> options) {
  final stars = navigateStars(
      humanBio: humanBio,
      starIterator: starIteratorMock,
      formulas: basicStarFormulas,
      stars: skyMock.stars,
      options: options);
  for (var star in stars.values) {
    print(star.toString());
  }
  print('Stars: ${stars.length}');
  expect(stars.length, starIteratorMock.priorityList.length);
}
