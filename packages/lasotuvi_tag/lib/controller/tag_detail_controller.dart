part of lasotuvi_tag;

class TagDetailController extends ChangeNotifier {
  TagDetailController({required this.onData});
  final OnTagHasCharts onData;
  StreamSubscription<TagHasCharts?>? _subscription;
  StreamController<TagHasCharts?>? _streamController;

  Stream<TagHasCharts?> stream(String? uid, int chartId) {
    _streamController = StreamController<TagHasCharts?>.broadcast();
    listen(uid, chartId);
    return _streamController!.stream;
  }

  void listen(String? uid, int chartId) {
    _subscription = onData(uid, chartId).listen((event) {
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
