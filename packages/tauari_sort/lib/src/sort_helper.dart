import 'package:hive/hive.dart';

import 'list_order.dart';
import 'sort_value.dart';

class SortHelper {
  static const sortOptionBoxName = 'sortOptionBox';
  static Future<void> saveSortOption(String key, SortValue sortValue) async {
    final box = await Hive.openBox<Map<dynamic, dynamic>>(sortOptionBoxName);
    await box.put(key, sortValue.dump());
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
