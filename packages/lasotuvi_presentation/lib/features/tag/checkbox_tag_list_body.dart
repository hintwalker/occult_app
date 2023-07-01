part of lasotuvi_presentation;

class CheckboxTagListBody extends ConsumerStatefulWidget {
  const CheckboxTagListBody(this.chart, {super.key});

  final Chart chart;

  @override
  ConsumerState<CheckboxTagListBody> createState() =>
      _CheckboxTagListBodyState();
}

class _CheckboxTagListBodyState extends AuthDependedState<CheckboxTagListBody> {
  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const LoadingWidget()
        : CheckboxTagListModal(
            controller: ref.read(tagHasChartsListControllerProvider),
            uid: uid,
            chartId: widget.chart.id,
            translate: translate,
            colorScheme: lightColorScheme,
            onCancel: onCancel,
            onSubmit: onSubmit,
            onItemTap: (context, tag, _) =>
                TagHelper.openTagDetail(context: context, tag: tag),
          );
  }

  void onCancel(BuildContext context) {
    context.pop();
  }

  Future<void> onSubmit(BuildContext context,
      Iterable<SelectableItem<TagHasCharts>> tagHasCharts, String? uid) async {
    final connectedTags = tagHasCharts
        .where(
          (element) => !element.initSelected && element.selected,
        )
        .map((e) => e.data.source);

    final disConnectedTags = tagHasCharts
        .where(
          (element) => element.initSelected && !element.selected,
        )
        .map((e) => e.data.source);
    await ref
        .read(connectTagsToChartProvider)
        .call(uid: uid, left: widget.chart, rights: connectedTags);

    await ref
        .read(disConnectTagsFromChartProvider)
        .call(uid: uid, left: widget.chart, rights: disConnectedTags);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.pop();
      }
    });
  }
}
