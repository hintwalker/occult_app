import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunoom/sunoom.dart';
import 'package:sunoom_calendar_input/sunoom_calendar_input.dart';

import '../chart_creation_notifier.dart';
import '../controller/birthday_controller.dart';

class ChartBirthdayInput extends ConsumerWidget {
  const ChartBirthdayInput({
    super.key,
    required this.colorScheme,
    required this.translate,
    required this.controller,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final BirthdayController controller;

  void onDateChanged(
    Moment moment,
    WidgetRef ref,
  ) {
    ref.read(chartCreationNotifierProvider.notifier).updateBirthday(moment);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moment = controller.value;
    //initialMoment(const TimeZone(offsetInHour: 7));
    return CalendarInput(
      colorScheme: colorScheme,
      translate: translate,
      onDateChanged: (moment, {required valid}) =>
          controller.onChanged(moment, valid),
      // onValidate: (valid) =>
      //     ref.read(chartCreationNotifierProvider.notifier).updateValid(valid),
      initValue: moment,
    );
  }
}
