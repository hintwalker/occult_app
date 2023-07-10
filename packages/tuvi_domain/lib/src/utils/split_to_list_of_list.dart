extension SplitToListOfListExtension on String {
  List<List<int>> splitToListOfList(String spliterMajor, String spliterMinor) {
    return split(',')
        .map(
          (e) => e.split(';').map((s) => int.parse(s)).toList(),
        )
        .toList();
  }
}
