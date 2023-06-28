part of '../../main.dart';

class ChartDetailScreen extends StatelessWidget {
  const ChartDetailScreen({
    super.key,
    required this.chartId,
    this.restorationId,
  });

  final String? restorationId;
  // final String? uid;
  final String chartId;

  @override
  Widget build(BuildContext context) {
    return RestorableStatelessWidget(
      restorationId: restorationId,
      child: ChartDetailBody(chartId: chartId),
      // child: Scaffold(
      //   appBar: const PreferredSize(
      //       preferredSize: Size.fromHeight(48), child: ChartScreenAppBar()),
      //   body: ChartDetailBody(chartId: chartId),
      // )
    );
  }
}
