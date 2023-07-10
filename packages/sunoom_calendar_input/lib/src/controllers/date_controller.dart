import 'package:flutter/material.dart';

import '../validators/month_validator.dart';
import '../validators/year_validator.dart';

abstract class DateController extends ChangeNotifier {
  int? day;
  int? month;
  int? year;
  final MonthValidator monthValidator;
  final YearValidator yearValidator;
  FormState? state;
  TextEditingController? dayController;
  TextEditingController? monthController;
  TextEditingController? yearController;

  DateController({
    this.day,
    this.month,
    this.year,
    required this.monthValidator,
    required this.yearValidator,
  });

  void setDay(int? value) {
    day = value;
    if (dayController == null) {
      return;
    }
    if (value == null) {
      dayController!.text = '';
    } else {
      dayController!.text = '$value';
      dayController!.selection =
          TextSelection.collapsed(offset: value.toString().length);
    }
  }

  void setMonth(int? value) {
    month = value;
    if (monthController == null) {
      return;
    }
    if (value == null) {
      monthController!.text = '';
    } else {
      monthController!.text = '$value';
      monthController!.selection =
          TextSelection.collapsed(offset: value.toString().length);
    }
  }

  void setYear(int? value) {
    year = value;
    if (yearController == null) {
      return;
    }
    if (value == null) {
      yearController!.text = '';
    } else {
      yearController!.text = '$value';
      try {
        yearController!.selection =
            TextSelection.collapsed(offset: value.toString().length);
        // ignore: empty_catches
      } catch (e) {}
    }
  }

  void updateDay(String? day, FormState? state) {
    if (day == null || day.isEmpty) {
      this.day = null;
    } else {
      this.day = int.parse(day);
    }
    this.state = state;
    notifyListeners();
  }

  void updateMonth(String? month, FormState? state) {
    if (month == null || month.isEmpty) {
      this.month = null;
    } else {
      this.month = int.parse(month);
    }
    this.state = state;
    notifyListeners();
  }

  void updateYear(String? year, FormState? state) {
    if (year == null || year.isEmpty) {
      this.year = null;
    } else {
      this.year = int.parse(year);
    }
    this.state = state;
    notifyListeners();
  }

  String? validateYear(String? value) => yearValidator.validate(value);

  String? validateMonth(String? value) => monthValidator.validate(value);

  String? validateDay(String? value);
}
