part of lasotuvi_chart;

class CheckboxChartListBuilder extends StatelessWidget {
  const CheckboxChartListBuilder({
    super.key,
    required this.controller,
    required this.translate,
    required this.colorScheme,
    required this.onCancel,
    required this.onSubmit,
    this.uid,
  });

  final ChartListController controller;
  final String? uid;

  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext context, Iterable<Chart> charts, String? uid)
      onSubmit;
  final void Function(BuildContext context) onCancel;

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
            return CheckBoxChartListWidget(
              snapshot.requireData,
              translate: translate,
              colorScheme: colorScheme,
              onSubmit: onSubmit,
              onCancel: onCancel,
            );
          } else {
            return const Center(
              child: ErrorTextWidget(),
            );
          }
        });
  }
}
