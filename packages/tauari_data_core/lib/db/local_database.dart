part of tauari_data_core;

abstract class LocalDatabase<T> {
  final updateTriggerController = StreamController<bool>.broadcast();
  String get dbName => 'lasotuvi_v1_2.db';
  int get dbVersion;
  T? db;
  Future<T?> get ready;
  Future open();
  Future openPath(String path);
  Future close();
  Future deleteDb();
  void triggerUpdate() {
    updateTriggerController.sink.add(true);
  }
}
