import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lasotuvi_note/lasotuvi_note.dart';

final noteEditorCacheProvider = FutureProvider<NoteEditorCache>((ref) async {
  final box = await Hive.openBox(boxNameNoteCache);
  return NoteEditorCache(box);
});
