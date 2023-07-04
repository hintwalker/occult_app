part of '../../main.dart';

class ChartDetailScreen extends StatelessWidget {
  const ChartDetailScreen({
    super.key,
    required this.chartId,
    required this.syncStatus,
    this.restorationId,
  });

  final String? restorationId;
  // final String? uid;
  final String chartId;
  final String syncStatus;

  @override
  Widget build(BuildContext context) {
    return RestorableStatelessWidget(
        restorationId: restorationId,
        child: Container(
          color: LasotuviAppStyle.colorScheme.background,
          child: ChartDetailBody(
            chartId: chartId,
            syncStatus: syncStatus,
          ),
        )
        // child: Scaffold(
        //   appBar: const PreferredSize(
        //       preferredSize: Size.fromHeight(48), child: ChartScreenAppBar()),
        //   body: ChartDetailBody(chartId: chartId),
        // )
        );
  }
}
