import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should display datetime in milliseconds', () {
    if (kDebugMode) {
      print('${DateTime.now().millisecondsSinceEpoch}');
    }
  });
}
