import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunoom/sunoom.dart';
import 'package:sunoom_calendar_input/sunoom_calendar_input.dart'
    show CalendarInput;
import 'package:tuvi_chart_creation_form/initial_moment.dart';

import '../chart_creation_notifier.dart';

class ChartBirthdayInput extends ConsumerWidget {
  const ChartBirthdayInput({
    super.key,
    required this.colorScheme,
    required this.translate,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;

  void onDateChanged(
    Moment moment,
    WidgetRef ref,
  ) {
    ref.read(chartCreationNotifierProvider.notifier).updateBirthday(moment);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moment = initialMoment(const TimeZone(offsetInHour: 7));
    return CalendarInput(
      colorScheme: colorScheme,
      translate: translate,
      onDateChanged: (moment) => onDateChanged(moment, ref),
      initValue: moment,
    );
  }
}
