part of lasotuvi_presentation;

class TagDetailBody extends ConsumerStatefulWidget {
  const TagDetailBody({
    super.key,
    required this.tagId,
  });
  final String tagId;

  @override
  ConsumerState<TagDetailBody> createState() => _TagDetailBodyState();
}

class _TagDetailBodyState extends AuthDependedState<TagDetailBody> {
  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const LoadingWidget()
        : TagDetailBuilder(
            uid: uid,
            tagId: widget.tagId,
            controller: ref.read(tagDetailControllerProvider),
            colorScheme: lightColorScheme,
            translate: translate,
            // onChartItemTap: (context, chart) =>
            //     ChartHelper.openChartView(context: context, chart: chart),
            onChangeInfoTap: (context, tag) =>
                TagHelper.openTagEdit(context, tag),
            tagSyncOptions: (tag, {syncStatus, uid}) =>
                StorageHelper.storageOptionsModalBuilder<Tag>(tag, ref: ref),
            // chartSyncOptions: (chart, {syncStatus, uid}) =>
            //     StorageHelper.storageOptionsModalBuilder<Chart>(chart,
            //         ref: ref),
            onOpenChartList: (context, tag) =>
                ChartHelper.openCheckboxChartList(context, tag),
            chartItem: (chart) => HoriChartItemWidget(
              chart,
              uid: uid,
              colorScheme: lightColorScheme,
              translate: translate,
              onTap: (context, chart) =>
                  ChartHelper.openChartView(context: context, chart: chart),
              onSyncStatusTap: () => StorageHelper.showOptionsModal<Chart>(
                  chart,
                  context: context,
                  ref: ref),
            ),
          );
  }
}
