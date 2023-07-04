part of lasotuvi_provider;

final noteEditorCacheProvider = FutureProvider<NoteEditorCache>((ref) async {
  final box = await Hive.openBox(boxNameNoteCache);
  return NoteEditorCache(box);
});
