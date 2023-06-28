part of tuvi_chart_creation_form;

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
