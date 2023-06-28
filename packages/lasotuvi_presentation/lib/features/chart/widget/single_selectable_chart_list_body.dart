part of lasotuvi_presentation;

class SingleSelectableChartListBody extends ConsumerStatefulWidget {
  const SingleSelectableChartListBody({
    super.key,
    required this.onSelect,
  });

  final void Function(BuildContext context, Chart chart, String? uid) onSelect;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SingleSelectableChartListBodyState();
}

class _SingleSelectableChartListBodyState
    extends AuthDependedState<SingleSelectableChartListBody> {
  @override
  Widget build(BuildContext context) {
    return SingleSelectableChartListModal(
        controller: ref.read(chartListControllerProvider),
        translate: translate,
        colorScheme: lightColorScheme,
        onItemTap: widget.onSelect,
        uid: uid);
  }

  // void onItemTap(BuildContext context, Chart chart, String? uid) {
  //   context.pushNamed(RouteName.chartView, pathParameters: {
  //     RouterParams.chartId: chart.id.toString(),
  //     RouterParams.uid: uid ?? RouterParams.uidNullValue
  //   });
  // }
}
