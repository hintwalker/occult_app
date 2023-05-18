part of tauari_drawer;

class TauariDrawerController extends ChangeNotifier {
  String screenId = 'home';
  void setScreenId(String id) {
    screenId = id;
    notifyListeners();
  }
}
