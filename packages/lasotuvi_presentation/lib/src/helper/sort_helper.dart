import 'package:hive/hive.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

class SortHelper {
  static const sortOptionBoxName = 'sortOptionBox';
  static Future<void> saveSortOption(String key, SortValue sortOption) async {
    final box = await Hive.openBox<Map<dynamic, dynamic>>(sortOptionBoxName);
    await box.put(key, sortOption.dump());
  }

  static Future<SortValue?> getSortOption(String key) async {
    final box = await Hive.openBox<Map<dynamic, dynamic>>(sortOptionBoxName);
    final data = box.get(
      key,
    );
    if (data == null) {
      return const SortValue('', ListOrder.asc);
    }
    return SortValue.fromMap(data);
  }
}
