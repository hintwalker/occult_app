// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test name', () {
    print(DateTime.now().millisecondsSinceEpoch);
    print(DateTime(2030, 12, 31).millisecondsSinceEpoch);
  });
}
