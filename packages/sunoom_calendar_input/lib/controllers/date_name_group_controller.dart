import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

class DateNameGroupController extends ChangeNotifier {
  Cans? dayCan;
  Chies? dayChi;
  Cans? monthCan;
  Chies? monthChi;
  Cans? yearCan;
  Chies? yearChi;

  void setDayCan(Cans? value) {
    dayCan = value;
    notifyListeners();
  }

  void setDayChi(Chies? value) {
    dayChi = value;
    notifyListeners();
  }

  void setMonthCan(Cans? value) {
    monthCan = value;
    notifyListeners();
  }

  void setMonthChi(Chies? value) {
    monthChi = value;
    notifyListeners();
  }

  void setYearCan(Cans? value) {
    yearCan = value;
    notifyListeners();
  }

  void setYearChi(Chies? value) {
    yearChi = value;
    notifyListeners();
  }
}
