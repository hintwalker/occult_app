part of tauari_subscription;

class CurrentSubController extends ChangeNotifier {
  CurrentSubController(this.onCurrentSub);
  final OnCurrentSub onCurrentSub;
  StreamSubscription<Subscription?>? _subscription;
  StreamController<Subscription?>? _streamController;
  Stream<Subscription?> dataStream(String? uid) {
    if (uid == null) {
      return Stream.value(null);
    }

    _streamController = StreamController<Subscription?>.broadcast();
    listen(uid);
    return _streamController!.stream;
  }

  void listen(String? uid) {
    _subscription = onCurrentSub(uid).listen((event) {
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
