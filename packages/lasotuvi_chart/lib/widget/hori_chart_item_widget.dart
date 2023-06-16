part of lasotuvi_chart;

class HoriChartItemWidget extends StatelessWidget {
  const HoriChartItemWidget(this.item, {super.key});
  final Chart item;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        child: Column(
          children: [Text(item.name)],
        ),
      ),
    ]);
  }
}
