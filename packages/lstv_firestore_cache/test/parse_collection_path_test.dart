// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should match energy collection path', () {
    const energyPattern = r'(?<=e(.*)\s?e{1}$)';
    final regExp = RegExp(energyPattern, caseSensitive: false);
    expect(regExp.hasMatch('e/a.blackmoonj78.gmail.com/e'), true);
    expect(regExp.hasMatch('c/a.blackmoonj78.gmail.com/e'), false);
    expect(regExp.hasMatch('e/a.blackmoonj78.gmail.com/c'), false);
  });
  test('should match chart collection path', () {
    const energyPattern = r'(?<=tuvi(.*)\s?c{1}$)';
    final regExp = RegExp(energyPattern, caseSensitive: false);
    expect(regExp.hasMatch('tuvi/a.blackmoonj78.gmail.com/c'), true);
    expect(regExp.hasMatch('tuvi/a.blackmoonj78.gmail.com/a'), false);
  });

  test('should get uid from collection path', () {
    final RegExp exp = RegExp(r'(?<=\/)(.*?)(?=\/)');
    print(exp.firstMatch("e/a.blackmoonj78.gmail.com/e/c")![0]);
  });
}
