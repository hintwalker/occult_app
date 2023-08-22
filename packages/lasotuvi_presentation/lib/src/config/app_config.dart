import 'package:flutter/foundation.dart' show kDebugMode;

class AppConfig {
  static const bool showAds = false;
  static const bool showCurrentPlan = false;
  static const int limitNoteCharaterCount = kDebugMode ? 5000 : 5000;
}
