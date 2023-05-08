import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';

void main() {
  test('should create hoa giap from index', () {
    final hoaGiap = HoaGiap.fromIndex(0);
    expect(hoaGiap.index, 0);
    print(hoaGiap.name);
    expect(hoaGiap.name, 'Hải Trung Kim');
  });

  test('should create hoa giap from factory', () {
    // final hoaGiap = HoaGiap.haiTrungKim();
    // expect(hoaGiap.index, 0);
    // print(hoaGiap.name);
    // expect(hoaGiap.name, 'Hải Trung Kim');
  });
}
