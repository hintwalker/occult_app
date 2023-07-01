part of lasotuvi_chart;

class TopTenChartsBanner extends StatelessWidget {
  const TopTenChartsBanner({
    super.key,
    required this.uid,
    required this.controller,
    required this.translate,
    required this.colorScheme,
    required this.onAddData,
    required this.onShowAll,
    required this.storageOptionsModalBuilder,
    required this.onItemTap,
  });

  final String? uid;
  final SyncableDataListStreamController<Chart> controller;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function() onAddData;
  final void Function() onShowAll;
  final Widget Function(Chart, {String? uid, String? syncStatus})
      storageOptionsModalBuilder;
  final void Function(BuildContext context, Chart chart) onItemTap;
  // final Widget Function(String chartId) chartView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TopTenHeadlineWidget(translate(TuviStrings.laSo),
              showAllText: translate(TuviStrings.showAll),
              colorScheme: colorScheme,
              onAddData: onAddData,
              onShowAll: onShowAll),
          Expanded(
              child: HorizontalDataListBuilder<Chart>(
                  uid: uid,
                  controller: controller,
                  itemWidget: (item) => HoriChartItemWidget(
                        item,
                        uid: uid,
                        translate: translate,
                        colorScheme: colorScheme,
                        // chartView: chartView,
                        onTap: onItemTap,
                        onSyncStatusTap: () =>
                            openStorageOptions(context, item),
                      ),
                  queryArgs: QueryArgs(
                    uid: uid,
                    limit: 9,
                    orderBy: '${ColumnChart.lastViewed} DESC',
                  )))
        ],
      ),
    );
  }

  void openStorageOptions(BuildContext context, Chart item) {
    showModalBottomSheet(
      context: context,
      builder: (_) =>
          // SingleChildScrollView(
          //       child:
          storageOptionsModalBuilder(item,
              syncStatus: item.syncStatus, uid: uid),
      // )
    );
  }
}

// class HorizontalChartList extends StatelessWidget {
//   const HorizontalChartList({
//     super.key,
//     required this.controller,
//     this.uid,
//   });

//   final ChartListController controller;
//   final String? uid;

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: controller.chartsStream(uid,
//             QueryArgs(uid: uid, limit: 10, orderBy: ColumnChart.lastViewed)),
//         builder: (ctx, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           } else if (snapshot.hasData) {
//             return ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (ctx, index) {
//                 return Text(snapshot.requireData.elementAt(index).name);
//               },
//               itemCount: snapshot.requireData.length,
//             );
//           } else {
//             return const Center(
//               child: Text('!'),
//             );
//           }
//         });
//   }
// }
