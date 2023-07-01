part of lasotuvi_presentation;

class CheckboxChartListBody extends ConsumerStatefulWidget {
  const CheckboxChartListBody(
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
    extends AuthDependedState<CheckboxChartListBody> {
  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const LoadingWidget()
        : CheckboxChartListModal(
            controller: ref.read(chartHasTagsListControllerProvider),
            uid: uid,
            // tagId: widget.tag.id,
            translate: translate,
            colorScheme: lightColorScheme,
            child: (chartHasTags) =>
                // CheckBoxChartListWidget(
                //   snapshot.requireData,
                //   uid: uid,
                //   tagId: tagId,
                //   translate: translate,
                //   colorScheme: colorScheme,
                //   onSubmit: onSubmit,
                //   onCancel: onCancel,
                //   onItemTap: onItemTap,
                // );

                CheckBoxChartListWidget(
                  chartHasTags,
                  uid: uid,
                  tagId: widget.tag.id,
                  translate: translate,
                  colorScheme: lightColorScheme,
                  onCancel: onCancel,
                  onSubmit: onSubmit,
                  onItemTap: (context, chart, _) =>
                      ChartHelper.openChartView(context: context, chart: chart),
                ));
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
    if (connectedCharts.isNotEmpty) {
      await ref
          .read(connectChartsToTagProvider)
          .call(uid: uid, right: widget.tag, lefts: connectedCharts);
    }

    if (disConnectedCharts.isNotEmpty) {
      await ref
          .read(disConnectChartsFromTagProvider)
          .call(uid: uid, right: widget.tag, lefts: disConnectedCharts);
    }
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.pop();
      }
    });
  }
}
