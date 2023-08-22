import 'package:hive_flutter/hive_flutter.dart';

import 'init_cache.dart';

Future<BoxCollection> setupCache() async {
  initTestCache();
  return await BoxCollection.open(
    'lstv_firestore_cache',
    {'e', 'sp', 'tuviChart', 'tuviTag', 'tuviNote'},
  );
}
