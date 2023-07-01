part of tauari_ui;

class SyncableDataStreamController<T extends SyncableEntity>
    extends ChangeNotifier {
  final OnSyncableData<T> onSyncableData;

  StreamSubscription<T?>? _subscription;
  StreamController<T?>? _streamController;

  SyncableDataStreamController({required this.onSyncableData});

  Stream<T?> stream({required String? uid, required int docId}) {
    _streamController = StreamController<T>.broadcast();
    listen(uid, docId);
    return _streamController!.stream;
  }

  void listen(String? uid, int docId) {
    _subscription = onSyncableData(uid: uid, docId: docId).listen((event) {
      _streamController?.add(event);
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _streamController?.close();
    super.dispose();
  }
}