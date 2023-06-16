part of lasotuvi_presentation;

class AllChartsBody extends ConsumerStatefulWidget {
  const AllChartsBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllChartsBodyState();
}

class _AllChartsBodyState extends AuthDependedState<AllChartsBody> {
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return AllChartListBuilder(
        controller: ref.read(chartHasTagsListControllerProvider),
        uid: uid,
        translate: translate,
        colorScheme: lightColorScheme,
        onOpenTag: onOpenTag,
        onOpenNote: onOpenNote,
        onOpenMore: onOpenMore,
        onItemTap: onItemTap,
        storageOptionsModalBuilder: (item, {onCloud, uid}) =>
            StorageHelper.storageOptionsModalBuilder<Chart>(item,
                onCloud: onCloud, uid: uid, ref: ref));
  }

  void onOpenTag(BuildContext context, Chart chart, String? uid) {
    context.pushNamed(RouteName.checkboxTagList, pathParameters: {
      RouterParams.chartId: chart.id.toString(),
      RouterParams.uid: uid ?? RouterParams.uidNullValue
    });
  }

  void onOpenNote(BuildContext context, Chart chart, String? uid) {}
  void onOpenMore(BuildContext context, Chart chart, String? uid) {}
  void onItemTap(BuildContext context, Chart chart, String? uid) {
    context.pushNamed(RouteName.chartView, pathParameters: {
      RouterParams.chartId: chart.id.toString(),
      RouterParams.uid: uid ?? RouterParams.uidNullValue
    });
  }
}
