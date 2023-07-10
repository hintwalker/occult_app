import 'package:flutter/material.dart';

class TauariDrawerController extends ChangeNotifier {
  String screenId = 'home';
  void setScreenId(String id) {
    screenId = id;
    notifyListeners();
  }
}
