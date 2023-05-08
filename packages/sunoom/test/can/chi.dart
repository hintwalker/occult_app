import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';

void main() {
  test('should create chi from index', () {
    final chi = Chi.fromIndex(Chies.dan.index);
    expect(chi.name, 'dan');
  });
}
