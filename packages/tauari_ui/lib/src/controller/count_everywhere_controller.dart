import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class CountEveryWhereController<T extends SyncableEntity>
    extends ChangeNotifier {
  CountEveryWhereController(this.onCountEveryWhere);
  final OnCountEveryWhere<T> onCountEveryWhere;

  StreamSubscription<int>? _subscription;
  StreamController<int>? _streamController;

  Stream<int> stream(String? uid) {
    _streamController = StreamController<int>.broadcast();
    listen(uid);
    return _streamController!.stream;
  }

  void listen(String? uid) {
    _subscription = onCountEveryWhere(uid).listen((event) {
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
