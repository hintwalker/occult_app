import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

void main() {
  test('should fit position -1 => 11', () {
    expectResult(-1, 11);
  });
  test('should fit position -2 => 10', () {
    expectResult(-2, 10);
  });
  test('should fit position -12 => 0', () {
    expectResult(-12, 0);
  });

  group('should fit position > 0', () {
    test('should fit position 1 => 1', () {
      expectResult(1, 1);
    });
    test('should fit position 11 => 11', () {
      expectResult(11, 11);
    });
    test('should fit position 12 => 0', () {
      expectResult(12, 0);
    });
    test('should fit position 24 => 0', () {
      expectResult(24, 0);
    });
    test('should fit position 23 => 11', () {
      expectResult(23, 11);
    });
    test('should fit position 25 => 1', () {
      expectResult(25, 1);
    });
  });
}

void expectResult(int testValue, int expectValue) {
  // final k = (testValue / 12.0).ceil().abs();
  // final result = testValue + (k + 1) * 12;
  final result = testValue.fitToHousePosition();
  print(result);
  expect(result, expectValue);
}
