// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:lstv_firestore_cache/src/query/query_from_map.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

void main() {
  test('should query on field', () {
    final data = {
      '1': {'name': 'a', 'old': 30},
      '2': {'name': 'b', 'old': 20},
    };
    final query = data.entries.where((element) => element.value['name'] == 'a');
    final result = Map<String, Map<dynamic, dynamic>>.fromEntries(query);
    print(result);
  });

  test('should query limit with order by key', () {
    final data = {
      '2': {'name': 'b', 'old': 20, 'ci': 3},
      '1': {'name': 'a', 'old': 30, 'ci': 2},
    };
    final query = queryFromMap(collection: data, limit: 1);
    print(query);
    final query2 = queryFromMap(collection: data);
    print(query2);
  });

  test('should query with field', () {
    final data = {
      '2': {'name': 'b', 'old': 20, 'ci': 3},
      '1': {'name': 'a', 'old': 30, 'ci': 2},
    };
    final query = queryFromMap(
        collection: data,
        where: const CloudDataWhere(field: 'ci', isEqualTo: 2));
    print(query);
  });

  test('should query with order by field', () {
    final data = {
      '2': {'name': 'b', 'old': 20, 'ci': 3},
      '1': {'name': 'a', 'old': 30, 'ci': 2},
    };
    final query = queryFromMap(
        collection: data, orderBy: const CloudDataOrderBy(field: 'name'));
    print(query);
    final query2 = queryFromMap(
      collection: data,
      orderBy: const CloudDataOrderBy(field: 'name', descending: true),
    );
    print(query2);
  });

  test('should query with order by field and limit', () {
    final data = {
      '2': {'name': 'b', 'old': 20, 'ci': 3},
      '1': {'name': 'a', 'old': 30, 'ci': 2},
      '3': {'name': 'c', 'old': 10, 'ci': 2},
    };
    final query = queryFromMap(
        collection: data,
        orderBy: const CloudDataOrderBy(field: 'name'),
        limit: 2);
    print(query);
  });
}
