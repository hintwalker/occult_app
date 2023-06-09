import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

class LeapMonthOptionsController extends ChangeNotifier {
  bool show = false;
  bool isLeapMonth = false;
  bool changedByUser = false;
  void showLeapMonthOptions() {
    if (!show) {
      show = true;
      notifyListeners();
    }
  }

  void hideLeapMonthOptions() {
    if (show) {
      show = false;
      notifyListeners();
    }
  }

  void choose(String value) {
    if (value == 'leap_month') {
      isLeapMonth = true;
    } else {
      isLeapMonth = false;
    }
    notifyListeners();
  }

  void toggle({
    required GregorianDate gregorianDate,
    required LuniSolarDate luniSolarDate,
    required int timeZoneOffset,
  }) {
    final monthLeap = leapMonthOfGregorianYear(
        gregorianDate.year, TimeZone(offsetInHour: timeZoneOffset));

    if (monthLeap == null || monthLeap.value != luniSolarDate.month) {
      hideLeapMonthOptions();
      isLeapMonth = luniSolarDate.isLeapMonth;
    } else {
      showLeapMonthOptions();
      isLeapMonth = luniSolarDate.isLeapMonth;
    }
    notifyListeners();
  }
}
