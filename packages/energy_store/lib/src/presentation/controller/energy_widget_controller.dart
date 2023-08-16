import 'dart:async';

import 'package:flutter/material.dart';

import '../../entity/energy.dart';
import '../../usecase/on_energy.dart';

class EnergyWidgetController extends ChangeNotifier {
  EnergyWidgetController({required this.onEnergy});
  // String? uid;
  // Energy energy;
  OnEnergy onEnergy;
  StreamSubscription<Energy>? _subscription;
  StreamController<Energy>? _streamController;

  // void setUid(String? uid) {
  //   uid = uid;

  //   notifyListeners();
  // }

  Stream<Energy> energyStream(String? uid) {
    if (uid == null) {
      return Stream.value(const Energy(0));
    }
    _streamController = StreamController<Energy>.broadcast();
    listen(uid);
    return _streamController!.stream.asBroadcastStream();
  }

  void listen(String? uid) {
    _subscription = onEnergy(uid).listen((event) {
      _streamController?.add(event);
    });
  }

  Future<void> stopListening() async {
    await _subscription?.cancel();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _streamController?.close();
    super.dispose();
  }
}
