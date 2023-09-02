import 'package:flutter/foundation.dart' show kDebugMode;

class AppConfig {
  static const bool showAds = true;
  static const bool showCurrentPlan = true;
  static const int limitNoteCharaterCount = kDebugMode ? 5000 : 5000;
  static const String version = 'v1.2.1';
}
