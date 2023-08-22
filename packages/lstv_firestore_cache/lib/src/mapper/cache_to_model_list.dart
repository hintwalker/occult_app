import 'package:tauari_data_core/tauari_data_core.dart';

Iterable<T> cacheToModelList<T extends CloudModel>(
  Map<String, Map<dynamic, dynamic>>? cache, {
  required Function(Map<String, Object?>) fromMap,
  bool idIsString = false,
}) {
  if (cache == null) {
    return const [];
  }
  final result = cache.entries.map<T>((e) {
    final id = idIsString ? e.key : int.parse(e.key);
    final data = e.value;
    return fromMap({
      ...data,
      columnId: id,
    });
  });
  return result;
}
