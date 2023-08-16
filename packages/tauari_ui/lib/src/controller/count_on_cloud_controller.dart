import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_utils/tauari_utils.dart';

class CountOnCloudController<T extends SyncableEntity> extends ChangeNotifier {
  CountOnCloudController({
    required this.onCountOnCloud,
    required this.checkNetworkStatus,
  });
  final OnCountOnCloud<T> onCountOnCloud;
  final CheckNetworkStatus checkNetworkStatus;

  StreamSubscription<int?>? _subscription;
  StreamController<int?>? _streamController;

  Future<bool> hasNetwork() => checkNetworkStatus();

  Stream<int?> stream(String uid) {
    _streamController = StreamController<int?>.broadcast();
    listen(uid);
    return _streamController!.stream;
  }

  void listen(String uid) {
    _subscription = onCountOnCloud(uid).listen((event) {
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
