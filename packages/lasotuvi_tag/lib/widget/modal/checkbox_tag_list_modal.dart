part of lasotuvi_tag;

class CheckboxTagListModal extends StatelessWidget {
  const CheckboxTagListModal({
    super.key,
    required this.child,
    // required this.chartId,
    // required this.controller,
    required this.translate,
    required this.colorScheme,
    // required this.onCancel,
    // required this.onSubmit,
    // required this.onItemTap,
    // this.uid,
  });
  final Widget child;
  // final TagHasChartsListController controller;
  // final String? uid;
  // final int chartId;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  // final void Function(BuildContext context) onCancel;
  // final void Function(BuildContext context,
  //     Iterable<SelectableItem<TagHasCharts>> tags, String? uid) onSubmit;
  // final void Function(BuildContext context, Tag tag, String? uid) onItemTap;

  @override
  Widget build(BuildContext context) {
    return BasicModal(
      title: translate('selectTag'),
      colorScheme: colorScheme,
      child: child,
      // CheckboxTagListBuilder(
      //   uid: uid,
      //   chartId: chartId,
      //   controller: controller,
      //   translate: translate,
      //   colorScheme: colorScheme,
      //   onCancel: onCancel,
      //   onSubmit: onSubmit,
      //   onItemTap: onItemTap,
      // ),
    );
  }
}
