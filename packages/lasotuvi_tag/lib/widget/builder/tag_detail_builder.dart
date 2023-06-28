part of lasotuvi_tag;

class TagDetailBuilder extends StatelessWidget {
  const TagDetailBuilder({
    super.key,
    this.uid,
    required this.tagId,
    required this.controller,
    required this.colorScheme,
    required this.translate,
    required this.onChartItemTap,
    required this.tagSyncOptions,
    required this.chartSyncOptions,
    required this.onChangeInfoTap,
    required this.onOpenChartList,
  });
  final TagDetailController controller;
  final String? uid;
  final String tagId;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final void Function(BuildContext context, Chart chart) onChartItemTap;
  final Widget Function(Tag, {String? uid, String? syncStatus}) tagSyncOptions;
  final Widget Function(Chart, {String? uid, String? syncStatus})
      chartSyncOptions;
  final void Function(BuildContext, Tag tag) onChangeInfoTap;
  final void Function(BuildContext context, Tag tag) onOpenChartList;

  @override
  Widget build(BuildContext context) {
    final docId = int.tryParse(tagId);
    return docId == null
        ? const ErrorTextWidget()
        : StreamBuilder(
            stream: controller.stream(uid, docId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              } else if (snapshot.hasData) {
                final tag = snapshot.requireData;
                return tag == null
                    ? const ErrorTextWidget()
                    : TagDetailWidget(
                        uid: uid,
                        tagHasCharts: tag,
                        colorScheme: colorScheme,
                        translate: translate,
                        onChartItemTap: onChartItemTap,
                        tagSyncOptions: tagSyncOptions,
                        chartSyncOptions: chartSyncOptions,
                        onChangeInfoTap: onChangeInfoTap,
                        onOpenChartList: onOpenChartList,
                      );
              } else {
                return const ErrorTextWidget();
              }
            },
          );
  }
}
