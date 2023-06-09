import 'package:flutter/material.dart';

class DateNameController<T extends Enum> extends ChangeNotifier {
  T? selected;
  DateNameController({this.selected});
  void select(T? value) {
    selected = value;
    notifyListeners();
  }
}
