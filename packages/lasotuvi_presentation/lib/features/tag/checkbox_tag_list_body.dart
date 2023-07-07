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
            translate: translate,
            colorScheme: LasotuviAppStyle.colorScheme,
            child: CheckboxTagListBuilder(
                uid: uid,
                controller: ref.watch(tagHasChartsListControllerProvider),
                child: (tagHasCharts) => CheckBoxTagListWidget(
                      tagHasCharts,
                      uid: uid,
                      translate: translate,
                      colorScheme: LasotuviAppStyle.colorScheme,
                      chartId: widget.chart.id,
                      onCancel: onCancel,
                      onSubmit: onSubmit,
                      onItemTap: (context, tag, _) =>
                          TagHelper.openTagDetail(context: context, tag: tag),
                      onOpenTagCreation: (context) =>
                          TagHelper.openTagCreationScreen(
                        context,
                        (tag) => doAfterCreation(tag, widget.chart),
                      ),
                      openSyncOptions: (uid, tag) =>
                          StorageHelper.showOptionsModal<Tag>(
                        tag,
                        uid: uid,
                        context: context,
                        ref: ref,
                      ),
                    )));
  }

  Future<void> doAfterCreation(Tag tag, Chart chart) async {
    await ref.read(connectChartsToTagProvider).call(
      uid: uid,
      right: tag,
      lefts: [chart],
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
    if (connectedTags.isNotEmpty) {
      await ref
          .read(connectTagsToChartProvider)
          .call(uid: uid, left: widget.chart, rights: connectedTags);
    }

    if (disConnectedTags.isNotEmpty) {
      await ref
          .read(disConnectTagsFromChartProvider)
          .call(uid: uid, left: widget.chart, rights: disConnectedTags);
    }

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.pop();
      }
    });
  }
}
