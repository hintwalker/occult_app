import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class TagHasChartsListController extends ChangeNotifier {
  TagHasChartsListController({required this.onData});

  final OnTagHasChartsList onData;

  StreamSubscription<Iterable<TagHasCharts>>? _subscription;
  StreamController<Iterable<TagHasCharts>>? _streamController;

  Stream<Iterable<TagHasCharts>> stream(String? uid, [QueryArgs? queryArgs]) {
    _streamController = StreamController<Iterable<TagHasCharts>>.broadcast();
    listen(uid, queryArgs);
    return _streamController!.stream;
  }

  void listen(String? uid, [QueryArgs? queryArgs]) {
    _subscription = onData(uid, queryArgs).listen((event) {
      if (!(_streamController == null || _streamController!.isClosed)) {
        _streamController?.add(event);
      }
    });
  }

  void stop() {
    _subscription?.pause();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _streamController?.close();
    super.dispose();
  }
}
