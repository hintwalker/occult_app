part of lasotuvi_chart;

class ChartDetailBuilder extends StatelessWidget {
  const ChartDetailBuilder({
    super.key,
    this.uid,
    required this.chartId,
    required this.translate,
    required this.colorScheme,
    required this.controller,
  });
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final ChartDetailController controller;
  final String? uid;
  final String chartId;

  @override
  Widget build(BuildContext context) {
    final docId = int.tryParse(chartId);
    return docId == null
        ? const ErrorTextWidget()
        : StreamBuilder(
            stream: controller.stream(uid: uid, docId: docId),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              } else if (snapshot.hasData) {
                final chart = snapshot.requireData;
                return chart == null
                    ? const ErrorTextWidget()
                    : ChartDetailWidget(
                        chart,
                        translate: translate,
                        colorScheme: colorScheme,
                      );
              } else {
                return const ErrorTextWidget();
              }
            });
  }
}
