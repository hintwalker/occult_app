// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';

import 'helper/cache_test_helper.dart';

late final CacheTestHelper cacheHelper;
void main() {
  setUp(() async {
    cacheHelper = CacheTestHelper();
    await cacheHelper.ready();
  });

  test('should save energy in cache', () async {
    final energy = {
      'blackmoonj78.gmail.com': {'v': 10}
    };
    final box = cacheHelper.energyBox;
    await box.put(energy.keys.first, energy.values.first);
    final savedValue = await box.get(energy.keys.first);
    print(savedValue.toString());
  });

  test('should save storage plan in cache', () async {
    final plans = {
      '0': {
        'c': 5,
        'e': 0,
        'n': 5,
        't': 5,
        'tt': 'T0',
      },
      '1': {
        'c': 25,
        'e': 360,
        'n': 25,
        't': 25,
        'tt': 'T1',
      }
    };
    final box = cacheHelper.storagePlanBox;
    for (var plan in plans.entries) {
      await box.put(plan.key, plan.value);
    }

    final savedValue = await box.getAllValues();
    print(savedValue.toString());

    final t1 = await box.get('1');
    print(t1);
  });

  test('should save tuvi chart in cache', () async {
    final data = {
      'blackmoonj78.gmail.com': {
        '1': {'name': 'Hinh'},
        '2': {'name': 'Thu'}
      }
    };
    final box = cacheHelper.chartBox;
    for (var item in data.entries) {
      await box.put(item.key, item.value);
    }

    final savedValue = await box.getAllValues();
    print(savedValue.toString());

    final t1 = await box.get('blackmoonj78.gmail.com');
    print(t1?['1']);
  });
}
