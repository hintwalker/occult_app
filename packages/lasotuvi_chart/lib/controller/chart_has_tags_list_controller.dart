part of lasotuvi_chart;

class ChartHasTagsListController extends ChangeNotifier {
  ChartHasTagsListController({required this.onData});

  final OnChartHasTagsList onData;

  StreamSubscription<Iterable<ChartHasTags>>? _subscription;
  StreamController<Iterable<ChartHasTags>>? _streamController;

  Stream<Iterable<ChartHasTags>> stream(String? uid, [QueryArgs? queryArgs]) {
    _streamController = StreamController<Iterable<ChartHasTags>>.broadcast();
    listen(uid, queryArgs);
    return _streamController!.stream;
  }

  void listen(String? uid, [QueryArgs? queryArgs]) {
    _subscription = onData(uid, queryArgs).listen((event) {
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
