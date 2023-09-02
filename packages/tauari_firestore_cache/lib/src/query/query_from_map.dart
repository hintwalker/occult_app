import 'package:tauari_data_core/tauari_data_core.dart';

Map<String, Map<dynamic, dynamic>> queryFromMap({
  required Map<String, Map<dynamic, dynamic>> collection,
  CloudDataOrderBy? orderBy,
  int? limit,
  CloudDataWhere? where,
}) {
  if (!(orderBy != null || limit != null || where != null)) {
    return collection;
  }
  // Map<String, Map<dynamic, dynamic>> result = {};
  final query = where == null
      ? collection.entries
      : collection.entries.where((element) =>
          compareWith(field: element.value[where.field], where: where));
  List<MapEntry<String, Map<dynamic, dynamic>>> resultEntries;
  if (limit != null) {
    resultEntries = query.toList();
    resultEntries.sort((a, b) {
      final key1 = int.parse(a.key);
      final key2 = int.parse(b.key);
      return key1.compareTo(key2);
    });
    resultEntries = resultEntries.take(limit).toList();
  } else {
    resultEntries = query.toList();
    if (orderBy != null) {
      resultEntries.sort((a, b) {
        final object1 = a.value.entries
            .firstWhere((element) => element.key == orderBy.field);
        final object2 = b.value.entries
            .firstWhere((element) => element.key == orderBy.field);
        if (orderBy.descending) {
          return object2.value.compareTo(object1.value);
        } else {
          return object1.value.compareTo(object2.value);
        }
      });
    } else {
      resultEntries.sort((a, b) {
        final key1 = int.parse(a.key);
        final key2 = int.parse(b.key);
        return key1.compareTo(key2);
      });
    }
  }
  // .map((e) => {e.key, e.value});
  final result = Map<String, Map<dynamic, dynamic>>.fromEntries(resultEntries);
  return result;
}

bool compareWith({
  required dynamic field,
  required CloudDataWhere where,
}) {
  if (where.isEqualTo != null) {
    return field == where.isEqualTo;
  }
  return false;
}
