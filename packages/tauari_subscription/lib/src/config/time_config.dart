import 'package:flutter/foundation.dart';

class TimeConfig {
  static const cancelDuration =
      kDebugMode ? Duration(minutes: 2) : Duration(days: 7);
  // static const debugCancelDuration = Duration(seconds: 60);
  static const expiredDuration =
      kDebugMode ? Duration(minutes: 2) : Duration(days: 30);
}
