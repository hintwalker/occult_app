import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class SyncablePairDataListStreamController<
    E extends SyncableEntity,
    O extends SyncableEntity,
    P extends SyncableEntityPair<E, O>> extends ChangeNotifier {
  final OnSyncablePairData<E, O, P> onSyncableData;

  StreamSubscription<Iterable<P>>? _subscription;
  StreamController<Iterable<P>>? _streamController;

  SyncablePairDataListStreamController({
    required this.onSyncableData,
  });

  Stream<Iterable<P>> stream(String? uid, [QueryArgs? queryArgs]) {
    _streamController = StreamController<Iterable<P>>.broadcast();
    listen(uid, queryArgs);
    return _streamController!.stream;
  }

  void listen(String? uid, [QueryArgs? queryArgs]) {
    _subscription =
        onSyncableData(uid: uid, queryArgs: queryArgs).listen((event) {
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
