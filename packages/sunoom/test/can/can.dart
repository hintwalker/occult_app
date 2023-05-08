import 'package:sunoom/sunoom.dart';
import 'package:test/test.dart';

void main() {
  test('should create at from index', () {
    final at = Can.fromIndex(Cans.at.index);
    expect(at.index, 1);
    expect(at.name, 'at');
  });

  test('should create at from enum', () {
    final at = Can.fromEnum(Cans.at);
    expect(at.index, 1);
    expect(at.name, 'at');
  });
}
