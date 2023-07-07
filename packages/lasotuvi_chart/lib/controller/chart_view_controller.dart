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
      if (!(_streamController == null || _streamController!.isClosed)) {
        _streamController?.add(event);
      }
    });
  }

  Stream<Iterable<Note>> noteStream(
    String? uid,
    Chart chart,
  ) {
    _notesStreamController = StreamController<Iterable<Note>>.broadcast();
    listenNotes(uid, chart);
    return _notesStreamController!.stream;
  }

  void listenNotes(String? uid, Chart chart) {
    _notesSubscription = onNotes(
      uid,
      chart.id,
      chart.syncStatus,
    ).listen((event) {
      if (!(_notesStreamController == null ||
          _notesStreamController!.isClosed)) {
        _notesStreamController?.add(event);
      }
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
