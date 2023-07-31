import 'package:flutter/foundation.dart';

class TimeConfig {
  static const cancelDuration =
      kDebugMode ? Duration(seconds: 30) : Duration(days: 7);
  // static const debugCancelDuration = Duration(seconds: 60);
  static const expiredDuration =
      kDebugMode ? Duration(seconds: 25) : Duration(days: 30);
}
