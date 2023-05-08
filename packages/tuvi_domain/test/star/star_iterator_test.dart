import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

void main() {
  test('should read iterator', () {
    final iterator = StarIterator([StarName.tuVi]);
    while (iterator.moveNext()) {
      print(iterator.current.name);
    }
  });
}
