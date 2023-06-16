part of lasotuvi_chart;

class TopTenChartsBanner extends StatelessWidget {
  const TopTenChartsBanner({
    super.key,
    required this.uid,
    required this.controller,
    required this.translate,
    required this.colorScheme,
  });

  final String? uid;
  final DataListStreamController<Chart> controller;
  final String Function(String) translate;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: HorizontalDataListBuilder<Chart>(
                  uid: uid,
                  controller: controller,
                  itemWidget: (item) => HoriChartItemWidget(
                        item,
                        uid: uid,
                        translate: translate,
                        colorScheme: colorScheme,
                      ),
                  queryArgs: QueryArgs(
                    uid: uid,
                    limit: 10,
                    orderBy: ColumnChart.lastViewed,
                  )))
        ],
      ),
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
