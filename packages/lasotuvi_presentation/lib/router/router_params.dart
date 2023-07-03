part of lasotuvi_presentation;

class RouterParams {
  static const chartId = 'chartId';
  static const uid = 'uid';
  static const nullValue = '_';

  static const tagId = 'tagId';
  static const noteId = 'noteId';

  static const syncStatus = 'syncStatus';

  static String? getPathParamValue(String pathParam) {
    return pathParam == nullValue ? null : pathParam;
  }
}
