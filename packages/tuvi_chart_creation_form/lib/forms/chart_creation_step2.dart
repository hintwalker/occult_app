part of tuvi_chart_creation_form;

class ChartCreationStep2 extends ConsumerWidget {
  const ChartCreationStep2({
    super.key,
    required this.colorScheme,
    required this.translate,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chart = ref.read(chartCreationNotifierProvider).chart;
    final birthday =
        chart.birthday.toMoment(TimeZone(offsetInHour: chart.timeZoneOffset));
    return Column(
      children: [
        ChartBirthdayInput(
          controller: BirthdayController(
            updateValid: (valid) => ref
                .read(chartCreationNotifierProvider.notifier)
                .updateValid(valid),
            value: birthday,
            updateValue: (moment) {
              if (moment == null) {
                return;
              }
              ref
                  .read(chartCreationNotifierProvider.notifier)
                  .updateBirthday(moment);
            },
          ),
          colorScheme: colorScheme,
          translate: translate,
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
