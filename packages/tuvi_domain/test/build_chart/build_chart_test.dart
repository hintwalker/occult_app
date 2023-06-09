import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../mock/bio/hinh.dart';
import '../mock/sky/sky_mock.dart';

void main() {
  late Sky sky;
  // late StarIterator starIterator;
  // late Map<String, Map<String, Object>> starFormulas;
  setUpAll(() {
    sky = skyMock;
    // Sky(SkyConfig.basic());
    // starIterator = StarIterator(starIteratorTranDoan);
    // starFormulas = starFormulasTranDoan;
  });
  test('should build chart', () {
    final chart = buildTuViChart(
      humanBio: hinh,
      sky: sky,
      // starIterator: sky.starIterator,
      // formulas: starFormulas
    );
    for (var house in chart.houses.entries) {
      print('${house.key.chi.name} - ${house.value.name.name}');
    }
    print(chart.houses[HousePosition.tyj()]!.name.name);
  });
}
