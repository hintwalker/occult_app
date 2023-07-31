import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class SyncableDataListStreamController<T extends SyncableEntity>
    extends ChangeNotifier {
  final OnSyncableDataList<T> onSyncableData;
  // final OnCountEveryWhere<T> onCount;

  StreamSubscription<Iterable<T>>? _subscription;
  StreamController<Iterable<T>>? _streamController;

  SyncableDataListStreamController({
    required this.onSyncableData,
  });

  Stream<Iterable<T>> stream(String? uid, [QueryArgs? queryArgs]) {
    _streamController = StreamController<Iterable<T>>.broadcast();
    listen(uid, queryArgs);
    return _streamController!.stream;
  }

  void listen(String? uid, [QueryArgs? queryArgs]) {
    _subscription = onSyncableData(uid, queryArgs).listen((event) {
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
}
