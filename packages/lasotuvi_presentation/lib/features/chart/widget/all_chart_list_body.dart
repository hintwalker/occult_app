part of lasotuvi_presentation;

class AllChartListBody extends ConsumerStatefulWidget {
  const AllChartListBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllChartBodyState();
}

class _AllChartBodyState extends AuthDependedState<AllChartListBody> {
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return findingUid
        ? const Center(child: CircularProgressIndicator())
        : AllChartListBuilder(
            controller: ref.watch(chartHasTagsListControllerProvider),
            uid: uid,
            child: (chartHasTags) => AllChartListWidget(
              chartHasTags,
              uid: uid,
              slidable: false,
              translate: translate,
              colorScheme: lightColorScheme,
              onOpenTag: onOpenTag,
              onOpenNote: onOpenNote,
              onOpenMore: onOpenMore,
              onItemTap: onItemTap,
              storageOptionsModalBuilder: (item, {syncStatus, uid}) =>
                  StorageHelper.storageOptionsModalBuilder<Chart>(item,
                      syncStatus: syncStatus, uid: uid, ref: ref),
            ),
          );
  }

  void onOpenTag(BuildContext context, Chart chart, String? uid) {
    context.pushNamed(RouteName.checkboxTagList, pathParameters: {
      RouterParams.chartId: chart.id.toString(),
      RouterParams.uid: uid ?? RouterParams.nullValue
    });
  }

  void onOpenNote(BuildContext context, Chart chart, String? uid) {}
  void onOpenMore(BuildContext context, Chart chart, String? uid) {}
  void onItemTap(BuildContext context, Chart chart, String? uid) {
    ChartHelper.openChartView(context: context, chart: chart);
    // context.pushNamed(RouteName.chartView, pathParameters: {
    //   RouterParams.chartId: chart.id.toString(),
    //   RouterParams.uid: uid ?? RouterParams.nullValue
    // });
  }
}
