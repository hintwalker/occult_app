part of lasotuvi_presentation;

class CheckBoxChartListBody extends ConsumerStatefulWidget {
  const CheckBoxChartListBody(
    this.tag, {
    super.key,
    // required this.onSubmit,
  });
  final Tag tag;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CheckBoxChartListBodyState();

  // final void Function(BuildContext context, Iterable<Chart> charts, String? uid)
  //     onSubmit;
}

class _CheckBoxChartListBodyState
    extends AuthDependedState<CheckBoxChartListBody> {
  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const LoadingWidget()
        : CheckboxChartListBuilder(
            controller: ref.read(chartHasTagsListControllerProvider),
            uid: uid,
            tagId: widget.tag.id,
            translate: translate,
            colorScheme: lightColorScheme,
            onCancel: onCancel,
            onSubmit: onSubmit,
            onItemTap: (context, chart, _) =>
                ChartHelper.openChartView(context: context, chart: chart),
          );
  }

  void onCancel(BuildContext context) {
    context.pop();
  }

  Future<void> onSubmit(BuildContext context,
      Iterable<SelectableItem<ChartHasTags>> chartHasTags, String? uid) async {
    final connectedCharts = chartHasTags
        .where(
          (element) => !element.initSelected && element.selected,
        )
        .map((e) => e.data.source);

    final disConnectedCharts = chartHasTags
        .where(
          (element) => element.initSelected && !element.selected,
        )
        .map((e) => e.data.source);
    await ref
        .read(connectChartsToTagProvider)
        .call(uid: uid, rightId: widget.tag.id, lefts: connectedCharts);

    await ref
        .read(disConnectChartsFromTagProvider)
        .call(uid: uid, rightId: widget.tag.id, lefts: disConnectedCharts);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.pop();
    });
  }
}
