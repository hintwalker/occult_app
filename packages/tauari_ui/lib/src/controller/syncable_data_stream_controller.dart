import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class SyncableDataStreamController<T extends SyncableEntity>
    extends ChangeNotifier {
  final OnSyncableData<T> onSyncableData;

  StreamSubscription<T?>? _subscription;
  StreamController<T?>? _streamController;

  SyncableDataStreamController({required this.onSyncableData});

  Stream<T?> stream(
      {required String? uid, required int docId, required String? syncStatus}) {
    _streamController = StreamController<T?>.broadcast();
    listen(uid, docId, syncStatus);
    return _streamController!.stream;
  }

  void listen(String? uid, int docId, String? syncStatus) {
    _subscription = onSyncableData(
      uid: uid,
      docId: docId,
      syncStatus: syncStatus,
    ).listen((event) {
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
