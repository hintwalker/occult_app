part of tauari_ui;

class DataListStreamController<T extends SyncableEntity>
    extends ChangeNotifier {
  final OnSyncableData<T> onSyncableData;

  StreamSubscription<Iterable<T>>? _subscription;
  StreamController<Iterable<T>>? _streamController;

  DataListStreamController({
    required this.onSyncableData,
  });

  Stream<Iterable<T>> stream(String? uid, [QueryArgs? queryArgs]) {
    _streamController = StreamController<Iterable<T>>.broadcast();
    listen(uid, queryArgs);
    return _streamController!.stream;
  }

  void listen(String? uid, [QueryArgs? queryArgs]) {
    _subscription = onSyncableData(uid, queryArgs).listen((event) {
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
