import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

import 'date_name_controller.dart';

class CanChiController extends ChangeNotifier {
  bool changedByOutside = false;
  DateNameController<Cans>? dayCanController;

  DateNameController<Chies>? dayChiController;

  DateNameController<Cans>? monthCanController;

  DateNameController<Chies>? monthChiController;

  DateNameController<Cans>? yearCanController;

  DateNameController<Chies>? yearChiController;

  void setCanDay(Cans? value) {
    if (dayCanController == null) {
      return;
    }
    changedByOutside = true;
    dayCanController!.select(value);
  }
}
