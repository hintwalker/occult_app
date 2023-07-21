import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

class ChartViewController extends ChangeNotifier {
  ChartViewController({
    required this.onData,
    required this.onNotes,
    required this.onRequestByChartId,
    // required this.onCommentaries,
  });

  final OnChartHasTags onData;
  final OnNoteByChartId onNotes;
  final OnRequestByChartId onRequestByChartId;
  // final OnCommentaryByRequestId onCommentaries;

  StreamSubscription<ChartHasTags?>? _subscription;
  StreamController<ChartHasTags?>? _streamController;

  StreamSubscription<Iterable<Note>>? _notesSubscription;
  StreamController<Iterable<Note>>? _notesStreamController;

  StreamSubscription<Iterable<Request>>? _requestSubscription;
  StreamController<Iterable<Request>>? _requestStreamController;

  // StreamSubscription<Iterable<Commentary>>? _commentarySubscription;
  // StreamController<Iterable<Commentary>>? _commentaryStreamController;

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

  Stream<Iterable<Request>> requestStream(
    String? uid,
    Chart chart,
  ) {
    _requestStreamController = StreamController<Iterable<Request>>.broadcast();
    listenRequest(uid, chart);
    return _requestStreamController!.stream;
  }

  void listenRequest(String? uid, Chart chart) {
    _requestSubscription = onRequestByChartId(
      uid,
      chart.id,
      chart.syncStatus,
    ).listen((event) {
      if (!(_requestStreamController == null ||
          _requestStreamController!.isClosed)) {
        _requestStreamController?.add(event);
      }
    });
  }

  // Stream<Iterable<Commentary>> commentaryStream(
  //   String? uid,
  //   Chart chart,
  // ) {
  //   _commentaryStreamController =
  //       StreamController<Iterable<Commentary>>.broadcast();
  //   listenCommentaries(uid, chart);
  //   return _commentaryStreamController!.stream;
  // }

  // void listenCommentaries(String? uid, Chart chart) {
  //   _commentarySubscription = onCommentaries(
  //     uid,
  //     chart.id,
  //     chart.syncStatus,
  //   ).listen((event) {
  //     if (!(_commentaryStreamController == null ||
  //         _commentaryStreamController!.isClosed)) {
  //       _commentaryStreamController?.add(event);
  //     }
  //   });
  // }

  @override
  void dispose() {
    _subscription?.cancel();
    _streamController?.close();
    _notesSubscription?.cancel();
    _notesStreamController?.close();
    _requestSubscription?.cancel();
    _requestStreamController?.close();
    // _commentarySubscription?.cancel();
    // _commentaryStreamController?.close();
    super.dispose();
  }
}
