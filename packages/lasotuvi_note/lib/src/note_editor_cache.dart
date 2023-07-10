import 'package:hive/hive.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

class NoteEditorCache {
  final Box box;
  const NoteEditorCache(this.box);
  Future<void> save(Note note) async {
    // final box = await Hive.openBox(BoxNames.noteCache);
    await box.put(note.id.toString(), note.dump());
  }

  Future<Note?> get(String id) async {
    // final box = await Hive.openBox(BoxNames.noteCache);
    final map = await box.get(id);
    if (map == null) {
      return null;
    }
    return Note.fromMap(map);
  }

  Future<void> clear(String id) async {
    // final box = await Hive.openBox(BoxNames.noteCache);
    await box.delete(id);
  }

  Future<void> clearAll() async {
    // final box = await Hive.openBox(BoxNames.noteCache);
    await box.clear();
  }
}
