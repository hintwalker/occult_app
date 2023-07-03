part of lasotuvi_chart;

class ChartViewController extends ChangeNotifier {
  ChartViewController({
    required this.onData,
    required this.onNotes,
  });

  final OnChartHasTags onData;
  final OnNoteByChartId onNotes;

  StreamSubscription<ChartHasTags?>? _subscription;
  StreamController<ChartHasTags?>? _streamController;

  StreamSubscription<Iterable<Note>>? _notesSubscription;
  StreamController<Iterable<Note>>? _notesStreamController;

  Stream<ChartHasTags?> stream(String? uid, Chart chart) {
    _streamController = StreamController<ChartHasTags?>.broadcast();
    listen(uid, chart);
    return _streamController!.stream;
  }

  void listen(String? uid, Chart chart) {
    _subscription = onData(uid, chart).listen((event) {
      _streamController?.add(event);
    });
  }

  Stream<Iterable<Note>> noteStream(String? uid, int chartId) {
    _notesStreamController = StreamController<Iterable<Note>>.broadcast();
    listenNotes(uid, chartId);
    return _notesStreamController!.stream;
  }

  void listenNotes(String? uid, int chartId) {
    _notesSubscription = onNotes(uid, chartId).listen((event) {
      _notesStreamController?.add(event);
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _streamController?.close();
    _notesSubscription?.cancel();
    _notesStreamController?.close();
    super.dispose();
  }
}
