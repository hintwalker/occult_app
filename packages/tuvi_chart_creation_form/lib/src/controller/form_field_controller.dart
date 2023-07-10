import 'package:flutter/material.dart';

abstract class FormFieldController<T> extends ChangeNotifier {
  FormFieldController({
    required this.value,
    required this.updateValid,
    required this.updateValue,
  });
  T value;
  final void Function(bool) updateValid;
  final void Function(T) updateValue;
  void onChanged(T value, bool valid) {
    this.value = value;
    updateValid(valid);
    if (valid) {
      updateValue(value);
    }
  }
}
