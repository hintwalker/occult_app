part of lasotuvi_chart;

class CheckboxChartListBuilder extends StatelessWidget {
  const CheckboxChartListBuilder({
    super.key,
    this.uid,
    // required this.tagId,
    required this.controller,
    required this.child,
    // required this.translate,
    // required this.colorScheme,
    // required this.onCancel,
    // required this.onSubmit,
    // required this.onItemTap,
  });

  final ChartHasTagsListController controller;
  final String? uid;
  // final int tagId;
  final Widget Function(Iterable<ChartHasTags> chartHasTags) child;
  // final String Function(String) translate;
  // final ColorScheme colorScheme;
  // final void Function(BuildContext context,
  //     Iterable<SelectableItem<ChartHasTags>> charts, String? uid) onSubmit;
  // final void Function(BuildContext context) onCancel;
  // final void Function(BuildContext context, Chart chart, String? uid) onItemTap;

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
            return child(snapshot.requireData);
            // CheckBoxChartListWidget(
            //   snapshot.requireData,
            //   uid: uid,
            //   tagId: tagId,
            //   translate: translate,
            //   colorScheme: colorScheme,
            //   onSubmit: onSubmit,
            //   onCancel: onCancel,
            //   onItemTap: onItemTap,
            // );
          } else {
            return const Center(
              child: ErrorTextWidget(),
            );
          }
        });
  }
}
