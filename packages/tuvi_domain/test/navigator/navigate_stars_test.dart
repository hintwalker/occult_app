import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';
import '../mock/bio/bi.dart';
import '../mock/bio/hinh.dart';
import '../mock/bio/tuan_tuong.dart';
import '../mock/sky/sky_mock.dart';
import '../mock/star/star_iterator_mock.dart';

void main() {
  test('should navigate stars hinh', () {
    testNavigate(hinh);
  });

  test('should navigate stars bi', () {
    testNavigate(bi);
  });

  test('should navigate stars tuanTuong', () {
    testNavigate(tuanTuong);
  });
}

void testNavigate(HumanBio humanBio) {
  final stars = navigateStars(
      humanBio: humanBio,
      starIterator: starIteratorMock,
      formulas: starFormulas,
      stars: skyMock.stars,
      options: SkyConfig.basicOptions);
  for (var star in stars.values) {
    print(star.toString());
  }
  print('Stars: ${stars.length}');
  expect(stars.length, starIteratorMock.priorityList.length);
}
