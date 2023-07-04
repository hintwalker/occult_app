part of tuvi_chart_creation_form;

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
