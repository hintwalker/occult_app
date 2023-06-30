part of lasotuvi_tag;

class TagDetailWidget extends StatelessWidget {
  const TagDetailWidget({
    super.key,
    this.uid,
    required this.tagHasCharts,
    required this.colorScheme,
    required this.translate,
    // required this.onChartItemTap,
    required this.tagSyncOptions,
    // required this.chartSyncOptions,
    required this.onChangeInfoTap,
    required this.onOpenChartList,
    required this.chartItem,
  });
  final String? uid;
  final TagHasCharts tagHasCharts;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  // final void Function(BuildContext context, Chart chart) onChartItemTap;
  final Widget Function(Tag, {String? uid, String? syncStatus}) tagSyncOptions;
  // final Widget Function(Chart, {String? uid, String? syncStatus})
  //     chartSyncOptions;
  final void Function(BuildContext context, Tag tag) onChangeInfoTap;
  final void Function(BuildContext context, Tag tag) onOpenChartList;
  final Widget Function(Chart chart) chartItem;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              tagHasCharts.source.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              tagHasCharts.source.subTitle,
              style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
                onPressed: () => onChangeInfoTap(
                      context,
                      tagHasCharts.source,
                    ),
                icon: const Icon(Icons.edit),
                label: Text(translate('changeInfo'))),
            const SizedBox(
              height: 24.0,
            ),
            Row(children: [
              Text(
                '${translate('chart')} (${tagHasCharts.carry.length})',
                style: TextStyle(fontSize: 22.0, color: colorScheme.primary),
              ),
              const SizedBox(width: 12.0),
              ElevatedButton.icon(
                onPressed: () => onOpenChartList(context, tagHasCharts.source),
                icon: const Icon(Icons.add_circle_outline),
                label: Text(
                  translate('addChart'),
                ),
              ),
            ]),
            DataGridWidget<Chart>(
              tagHasCharts.carry,
              itemWidget: (chart) => Center(child: chartItem(chart)),
              // HoriChartItemWidget(
              //   chart,
              //   uid: uid,
              //   colorScheme: colorScheme,
              //   translate: translate,
              //   onTap: onChartItemTap,
              //   onSyncStatusTap: () => openChartSyncOptions(context, chart),
              // ),
            ),
            const SizedBox(
              height: 196.0,
            )
          ],
        ),
      ),
    );
  }

  // void openChartSyncOptions(BuildContext context, Chart item) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) =>
  //           chartSyncOptions(item, syncStatus: item.syncStatus, uid: uid));
  // }

  void openTagSyncOptions(BuildContext context, Tag item) {
    showModalBottomSheet(
        context: context,
        builder: (_) =>
            tagSyncOptions(item, syncStatus: item.syncStatus, uid: uid));
  }
}
