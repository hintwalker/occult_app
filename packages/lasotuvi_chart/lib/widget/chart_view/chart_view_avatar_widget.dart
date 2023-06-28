part of lasotuvi_chart;

class ChartViewAvatarWidget extends StatelessWidget {
  const ChartViewAvatarWidget(
    this.chart, {
    super.key,
    this.uid,
    required this.colorScheme,
    required this.openSyncOptions,
  });
  final Chart chart;
  final String? uid;
  final ColorScheme colorScheme;
  final void Function(BuildContext context, Chart chart) openSyncOptions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 192.0,
      height: 192.0,
      child: Stack(
        children: [
          CircleHumanAvatar(
            gender: chart.gender.intValue,
            size: 168,
          ),
          Positioned(
            child: SyncStatusRibbonWidget(
              uid: uid,
              colorScheme: colorScheme,
              syncStatus: chart.syncStatus,
              onTap: () => openSyncOptions(context, chart),
            ),
          ),
        ],
      ),
    );
  }
}
