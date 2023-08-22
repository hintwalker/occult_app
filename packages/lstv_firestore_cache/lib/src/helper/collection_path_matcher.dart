bool matchEnergyPattern(String path) {
  const pattern = r'(?<=e(.*)\s?e{1}$)';
  final match = RegExp(pattern, caseSensitive: false);
  return match.hasMatch(path);
}

bool matchChartPattern(String path) {
  const pattern = r'(?<=tuvi(.*)\s?c{1}$)';
  final match = RegExp(pattern, caseSensitive: false);
  return match.hasMatch(path);
}

bool matchTagPattern(String path) {
  const pattern = r'(?<=tuvi(.*)\s?t{1}$)';
  final match = RegExp(pattern, caseSensitive: false);
  return match.hasMatch(path);
}

bool matchNotePattern(String path) {
  const pattern = r'(?<=tuvi(.*)\s?n{1}$)';
  final match = RegExp(pattern, caseSensitive: false);
  return match.hasMatch(path);
}

bool matchStoragePlanPattern(String path) {
  return path == 'sp';
}
