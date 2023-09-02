import 'package:flutter/foundation.dart' show kDebugMode;

class TableNames {
  static const chart = kDebugMode ? 'chart_test' : 'chart';
  static const tag = kDebugMode ? 'tag_test' : 'tag';
  static const note = kDebugMode ? 'note_test' : 'note';
  static const chartTag = kDebugMode ? 'chart_tag_test' : 'chart_tag';

  static const commentary = kDebugMode ? 'commentary_test' : 'commentary';

  static const request = kDebugMode ? 'request_test' : 'request';

  static const notification = kDebugMode ? 'notification_test' : 'notification';
}
