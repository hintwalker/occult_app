import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

import '../controllers/gregorian_date_controller.dart';

class WeekdayName extends StatelessWidget {
  const WeekdayName({
    super.key,
    required this.controller,
    required this.translate,
  });
  final GregorianDateController controller;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    final year = controller.year;
    final month = controller.month;
    final day = controller.day;
    return year == null || month == null || day == null
        ? const Text('!')
        : Text(
            translate(
              WeekDay.fromDateTime(
                DateTime(
                  year,
                  month,
                  day,
                ),
              ).name,
            ),
          );
  }
}
