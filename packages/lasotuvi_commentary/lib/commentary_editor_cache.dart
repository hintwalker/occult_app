import 'package:hive/hive.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

class CommentaryEditorCache {
  final Box box;
  const CommentaryEditorCache(this.box);
  Future<void> save(Commentary commentary) async {
    // final box = await Hive.openBox(BoxNames.commentaryCache);
    await box.put(commentary.id.toString(), commentary.dump());
  }

  Future<Commentary?> get(String id) async {
    // final box = await Hive.openBox(BoxNames.commentaryCache);
    final map = await box.get(id);
    if (map == null) {
      return null;
    }
    return Commentary.fromMap(map);
  }

  Future<void> clear(String id) async {
    // final box = await Hive.openBox(BoxNames.commentaryCache);
    await box.delete(id);
  }

  Future<void> clearAll() async {
    // final box = await Hive.openBox(BoxNames.commentaryCache);
    await box.clear();
  }
}
