// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tauari_utils/src/format_thousand_seperator.dart';

void main() {
  test('should format number', () {
    final formatValue =
        formatThousandSeperator(1234567865, locale: Platform.localeName);
    print(formatValue);
  });
}
