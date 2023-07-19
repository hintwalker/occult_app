import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

class ChartViewController extends ChangeNotifier {
  ChartViewController({
    required this.onData,
    required this.onNotes,
    required this.onCommentaries,
  });

  final OnChartHasTags onData;
  final OnNoteByChartId onNotes;
  final OnCommentaryByChartId onCommentaries;

  StreamSubscription<ChartHasTags?>? _subscription;
  StreamController<ChartHasTags?>? _streamController;

  StreamSubscription<Iterable<Note>>? _notesSubscription;
  StreamController<Iterable<Note>>? _notesStreamController;

  StreamSubscription<Iterable<Commentary>>? _commentarySubscription;
  StreamController<Iterable<Commentary>>? _commentaryStreamController;

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

  Stream<Iterable<Commentary>> commentaryStream(
    String? uid,
    Chart chart,
  ) {
    _commentaryStreamController =
        StreamController<Iterable<Commentary>>.broadcast();
    listenCommentaries(uid, chart);
    return _commentaryStreamController!.stream;
  }

  void listenCommentaries(String? uid, Chart chart) {
    _commentarySubscription = onCommentaries(
      uid,
      chart.id,
      chart.syncStatus,
    ).listen((event) {
      if (!(_commentaryStreamController == null ||
          _commentaryStreamController!.isClosed)) {
        _commentaryStreamController?.add(event);
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _streamController?.close();
    _notesSubscription?.cancel();
    _notesStreamController?.close();
    _commentarySubscription?.cancel();
    _commentaryStreamController?.close();
    super.dispose();
  }
}
