part of lasotuvi_chart;

class AllChartListBuilder extends StatelessWidget {
  const AllChartListBuilder({
    super.key,
    required this.controller,
    this.uid,
    required this.translate,
    required this.colorScheme,
    required this.onOpenTag,
    required this.onOpenNote,
    required this.onOpenMore,
    required this.onItemTap,
    required this.storageOptionsModalBuilder,
  });

  final ChartHasTagsListController controller;
  final String? uid;

  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext, Chart, String? uid) onOpenTag;
  final void Function(BuildContext, Chart, String? uid) onOpenNote;
  final void Function(BuildContext, Chart, String? uid) onOpenMore;
  final void Function(BuildContext, Chart, String? uid) onItemTap;
  final Widget Function(Chart, {String? uid, String? onCloud})
      storageOptionsModalBuilder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.stream(uid, QueryArgs(uid: uid)),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return AllChartListWidget(snapshot.requireData,
                translate: translate,
                colorScheme: colorScheme,
                onOpenTag: onOpenTag,
                onOpenNote: onOpenNote,
                onOpenMore: onOpenMore,
                onItemTap: onItemTap,
                storageOptionsModalBuilder: storageOptionsModalBuilder);
          } else {
            return const Center(
              child: Text('!'),
            );
          }
        });
  }
}
