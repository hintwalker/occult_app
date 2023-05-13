part of lasotuvi_chart;

class HorizontalChartList extends StatelessWidget {
  const HorizontalChartList({
    super.key,
    required this.controller,
    this.uid,
  });

  final ChartListController controller;
  final String? uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.chartsStream(uid,
            QueryArgs(uid: uid, limit: 10, orderBy: ColumnChart.lastViewed)),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Text(snapshot.requireData.elementAt(index).name);
              },
              itemCount: snapshot.requireData.length,
            );
          } else {
            return const Center(
              child: Text('!'),
            );
          }
        });
  }
}
