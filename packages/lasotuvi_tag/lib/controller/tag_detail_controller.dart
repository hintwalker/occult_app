part of lasotuvi_tag;

class TagDetailController extends ChangeNotifier {
  TagDetailController({required this.onData});
  final OnTagHasCharts onData;
  StreamSubscription<TagHasCharts?>? _subscription;
  StreamController<TagHasCharts?>? _streamController;

  Stream<TagHasCharts?> stream(String? uid, Tag tag) {
    _streamController = StreamController<TagHasCharts?>.broadcast();
    listen(uid, tag);
    return _streamController!.stream;
  }

  void listen(String? uid, Tag tag) {
    _subscription = onData(uid, tag).listen((event) {
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
