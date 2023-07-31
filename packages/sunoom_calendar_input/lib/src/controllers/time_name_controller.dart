import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

class TimeNameController extends ChangeNotifier {
  Cans? timeCan;
  Chies? timeChi;

  void setCan(Cans? value) {
    timeCan = value;
    notifyListeners();
  }

  void setChi(Chies? value) {
    timeChi = value;
    notifyListeners();
  }
}
