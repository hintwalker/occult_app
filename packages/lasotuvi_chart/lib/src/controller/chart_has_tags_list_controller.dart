import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class ChartHasTagsListController extends ChangeNotifier {
  ChartHasTagsListController({required this.onData});

  final OnChartHasTagsList onData;

  StreamSubscription<Iterable<ChartHasTags>>? _subscription;
  StreamController<Iterable<ChartHasTags>>? _streamController;

  Stream<Iterable<ChartHasTags>> stream(String? uid, [QueryArgs? queryArgs]) {
    _streamController = StreamController<Iterable<ChartHasTags>>.broadcast(
      onCancel: () => _subscription?.cancel(),
      onListen: () => _subscription?.resume(),
    );
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

  @override
  void dispose() {
    _subscription?.cancel();
    _streamController?.close();
    super.dispose();
  }

  void stop() {
    _subscription?.pause();
  }
}
