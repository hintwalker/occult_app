part of lasotuvi_chart;

class SingleSelectableChartListBuilder extends StatelessWidget {
  const SingleSelectableChartListBuilder({
    super.key,
    required this.controller,
    required this.translate,
    required this.colorScheme,
    required this.onItemTap,
    this.uid,
  });

  final ChartListController controller;
  final String? uid;

  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext, Chart, String? uid) onItemTap;

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
            return SingleSelectableChartListWidget(
              snapshot.requireData,
              translate: translate,
              colorScheme: colorScheme,
              onItemTap: onItemTap,
              uid: uid,
            );
          } else {
            return const Center(
              child: ErrorTextWidget(),
            );
          }
        });
  }
}
