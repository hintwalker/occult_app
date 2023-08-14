abstract class NoteLike<T> {
  T copyWithTitle(String title);
  T copyWithContent(String content);
  T coppyWithTitleAndContent({
    required String title,
    required String content,
    DateTime? time,
  });
  T get data;
  String get noteTitle;
  String get noteContent;
  int get noteId;
  String? get noteSyncStatus;
}
