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
            onChartItemTap: (context, chart) =>
                ChartHelper.openChartView(context: context, chart: chart),
            onChangeInfoTap: (context, tag) =>
                TagHelper.openTagEdit(context, tag),
            tagSyncOptions: (tag, {syncStatus, uid}) =>
                StorageHelper.storageOptionsModalBuilder<Tag>(tag, ref: ref),
            chartSyncOptions: (chart, {syncStatus, uid}) =>
                StorageHelper.storageOptionsModalBuilder<Chart>(chart,
                    ref: ref),
            onOpenChartList: (context, tag) =>
                ChartHelper.openCheckboxChartList(context, tag),
          );
  }
}
