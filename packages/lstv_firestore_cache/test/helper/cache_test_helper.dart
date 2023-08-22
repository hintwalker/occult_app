import 'package:hive_flutter/hive_flutter.dart';

import 'setup_cache.dart';

class CacheTestHelper {
  late final BoxCollection cache;
  late final CollectionBox<Map> energyBox;
  late final CollectionBox<Map> chartBox;
  late final CollectionBox<Map> tagBox;
  late final CollectionBox<Map> noteBox;
  late final CollectionBox<Map> storagePlanBox;

  Future<void> ready() async {
    cache = await setupCache();
    energyBox = await cache.openBox<Map>('e');
    chartBox = await cache.openBox<Map>('tuviChart');
    tagBox = await cache.openBox<Map>('tuviTag');
    noteBox = await cache.openBox<Map>('tuviNote');
    storagePlanBox = await cache.openBox<Map>('sp');
  }

  Future<void> close() async {
    await energyBox.clear();
    await chartBox.clear();
    await tagBox.clear();
    await noteBox.clear();
    await storagePlanBox.clear();
    cache.close();
  }
}
