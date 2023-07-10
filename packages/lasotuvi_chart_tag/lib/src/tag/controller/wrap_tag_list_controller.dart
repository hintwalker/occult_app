import 'package:flutter/material.dart';

class WrapTagListControler extends ChangeNotifier {
  void onSyncStatusChange() {
    notifyListeners();
  }
}
