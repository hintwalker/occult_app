import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

T? snapshotToModel<T extends CloudModel>(DocumentSnapshot snapshot,
    {required Function(Map<String, Object?>) fromMap,
    bool idIsString = false}) {
  if (snapshot.data() == null) {
    return null;
  }
  final map = snapshot.data() as Map<String, Object?>;
  final id = idIsString ? snapshot.id : int.parse(snapshot.id);
  return fromMap({
    ...map,
    columnId: id,
  });
}
