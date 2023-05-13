part of lasotuvi_chart;

class ChartListController extends ChangeNotifier {
  ChartListController({required this.onCharts});

  final OnCharts onCharts;

  StreamSubscription<Iterable<Chart>>? _subscription;
  StreamController<Iterable<Chart>>? _streamController;

  Stream<Iterable<Chart>> chartsStream(String? uid, [QueryArgs? queryArgs]) {
    _streamController = StreamController<Iterable<Chart>>.broadcast();
    listen(uid, queryArgs);
    return _streamController!.stream;
  }

  void listen(String? uid, [QueryArgs? queryArgs]) {
    _subscription = onCharts(uid, queryArgs).listen((event) {
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
