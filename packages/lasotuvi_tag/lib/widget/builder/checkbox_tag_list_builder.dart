part of lasotuvi_tag;

class CheckboxTagListBuilder extends StatelessWidget {
  const CheckboxTagListBuilder({
    super.key,
    this.uid,
    required this.chartId,
    required this.controller,
    required this.translate,
    required this.colorScheme,
    required this.onCancel,
    required this.onSubmit,
    required this.onItemTap,
  });

  final TagHasChartsListController controller;
  final String? uid;
  final int chartId;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext context,
      Iterable<SelectableItem<TagHasCharts>> tags, String? uid) onSubmit;
  final void Function(BuildContext context) onCancel;
  final void Function(BuildContext context, Tag tag, String? uid) onItemTap;

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
            return CheckBoxTagListWidget(
              snapshot.requireData,
              uid: uid,
              chartId: chartId,
              translate: translate,
              colorScheme: colorScheme,
              onSubmit: onSubmit,
              onCancel: onCancel,
              onItemTap: onItemTap,
            );
          } else {
            return const Center(
              child: ErrorTextWidget(),
            );
          }
        });
  }
}
