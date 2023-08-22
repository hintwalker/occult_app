// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';

import 'data_test/test_uid.dart';
import 'helper/cache_test_helper.dart';
import 'helper/firestore_test_helper.dart';

late final FirestoreTestHelper firestoreTestHelper;
late final CacheTestHelper cacheHelper;
void main() {
  setUp(() async {
    cacheHelper = CacheTestHelper();
    await cacheHelper.ready();
    firestoreTestHelper = FirestoreTestHelper();
    await firestoreTestHelper.ready();
  });
  group('Energy', () {
    test('fetch and save energy', () async {
      final energy = await firestoreTestHelper.repository.fetchEnergy();
      await cacheHelper.energyBox.put(testUid, {'v': energy});
      final cachedEnergy = await cacheHelper.energyBox.get(testUid);
      expect(cachedEnergy?['v'], 10);
      print(cachedEnergy);
    });

    test('fetch and save energy. Then update', () async {
      final energy = await firestoreTestHelper.repository.fetchEnergy();
      await cacheHelper.energyBox.put(testUid, {'v': energy});
      Map? cachedEnergy = await cacheHelper.energyBox.get(testUid);
      expect(cachedEnergy?['v'], 10);
      print(cachedEnergy);

      await cacheHelper.energyBox.put(testUid, {'v': 20});
      cachedEnergy = await cacheHelper.energyBox.get(testUid);
      print(cachedEnergy);
      print(await cacheHelper.energyBox.getAllValues());
      expect(cachedEnergy?['v'], 20);
    });
  });

  group('Chart', () {
    test('fetch save and edit, then upload chart', () async {
      final charts = await firestoreTestHelper.repository.fetchCharts();
      assert(charts != null);
      for (var chart in charts!.toList()) {
        await cacheHelper.chartBox.put(chart.keys.first, chart.values.first);
      }

      // get cached data
      final cachedCharts = await cacheHelper.chartBox.getAllValues();
      for (var chart in cachedCharts.entries) {
        print(chart);
      }
    });
  });
  tearDownAll(() async {
    await cacheHelper.close();
  });
}
