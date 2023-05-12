part of energy_store;

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
    _subscription = onEnergy(uid).listen((event) {
      _streamController?.add(event);
    });
    return _streamController!.stream;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _streamController?.close();
    super.dispose();
  }
}
