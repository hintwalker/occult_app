import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

import '../controllers/gregorian_date_controller.dart';

class WeekdayName extends StatefulWidget {
  const WeekdayName({
    super.key,
    required this.controller,
    required this.translate,
  });
  final GregorianDateController controller;
  final String Function(String) translate;

  @override
  State<StatefulWidget> createState() => _WeekdayNameState();
}

class _WeekdayNameState extends State<WeekdayName> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listenToController);
  }

  void listenToController() => setState(() {});

  @override
  void dispose() {
    widget.controller.removeListener(listenToController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final year = widget.controller.year;
    final month = widget.controller.month;
    final day = widget.controller.day;
    return year == null || month == null || day == null
        ? const Text('!')
        : Text(
            widget.translate(
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
