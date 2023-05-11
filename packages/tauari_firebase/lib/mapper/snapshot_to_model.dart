part of tauari_firebase;

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
