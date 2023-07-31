import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

class TauariSettings {
  static Future<void> saveMap({
    required String key,
    required Map<dynamic, dynamic> data,
    required String boxName,
  }) async {
    final box = await Hive.openBox<Map<dynamic, dynamic>>(boxName);
    await box.put(key, data);
  }

  static ValueListenable<dynamic> settings(String boxName) =>
      Hive.box(boxName).listenable();

  static Future<Box> openBox(String name) => Hive.openBox(name);

  static dynamic dataOfKey(String name, String key, {dynamic defaultValue}) =>
      Hive.box(name).get(
        key,
        defaultValue: defaultValue,
      ) ??
      0;

  static void save(String boxName, Map<dynamic, dynamic> data) {
    Hive.box(boxName).putAll(data);
  }

  static Map<String, dynamic> getAll(String boxName, Iterable<dynamic> keys,
      {dynamic defaultValue}) {
    final Map<String, dynamic> data = {};
    for (var key in keys) {
      data[key] = dataOfKey(
        boxName,
        key,
        defaultValue: defaultValue,
      );
    }
    return data;
  }
}
