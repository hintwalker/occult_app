part of tuvi_chart_creation_form;

class ChartCreationStep3 extends ConsumerWidget {
  const ChartCreationStep3({
    super.key,
    required this.colorScheme,
    required this.translate,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48),
      child: Center(
        child: SizedBox(
          width: 128,
          child: ChartWatchingYearInput(
            colorScheme: colorScheme,
            translate: translate,
            controller: WatchingYearController(
                value: ref
                    .read(chartCreationNotifierProvider)
                    .chart
                    .watchingYear
                    .toString(),
                updateValid: (value) => ref
                    .read(chartCreationNotifierProvider.notifier)
                    .updateValid(value),
                updateValue: (value) => ref
                    .read(chartCreationNotifierProvider.notifier)
                    .updateWatchingYear(value)),
          ),
        ),
      ),
    );
  }
}
