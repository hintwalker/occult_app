import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

Iterable<T> snapshotToModelList<T extends CloudModel>(
  QuerySnapshot snapshot, {
  required Function(Map<String, Object?>) fromMap,
  bool idIsString = false,
}) {
  var docs = snapshot.docs.map<T>((doc) {
    final data = doc.data() as Map<String, Object?>;
    final id = idIsString ? doc.id : int.parse(doc.id);
    return fromMap({
      ...data,
      columnId: id,
    });
  });
  return docs;
}
