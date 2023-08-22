import 'package:tauari_data_core/tauari_data_core.dart';

T? cacheToModel<T extends CloudModel>(
  Map<dynamic, dynamic>? cache, {
  required Function(Map<String, Object?>) fromMap,
  bool idIsString = false,
}) {
  if (cache == null) {
    return null;
  }
  final map = cache.values.first;
  if (map == null) {
    return null;
  }
  final id = idIsString ? cache.keys.first : int.parse(cache.keys.first);
  return fromMap({
    ...map,
    columnId: id,
  });
}
