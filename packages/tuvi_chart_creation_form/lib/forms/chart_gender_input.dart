part of tuvi_chart_creation_form;

class ChartGenderInput extends ConsumerWidget {
  ChartGenderInput(
      {super.key, required this.colorScheme, required this.translate});
  final controller = GroupButtonController();
  final ColorScheme colorScheme;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.selectIndex(
          ref.read(chartCreationNotifierProvider).chart.gender.index);
    });
    ref.listen(chartCreationNotifierProvider, (prev, next) {
      controller.selectIndex(next.chart.gender.index);
    });
    return GroupButton(
      controller: controller,
      isRadio: true,
      // onSelected: (value, index, isSelected) {
      //   ref.read(chartCreationNotifierProvider.notifier).updateGender(value);
      // },
      buttons: const [
        Gender.female,
        Gender.male,
      ],
      buttonBuilder: (selected, value, context) => selected
          ? ElevatedButton(
              onPressed: () {
                // controller.selectIndex(value.index);
                ref
                    .read(chartCreationNotifierProvider.notifier)
                    .updateGender(value);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primaryContainer),
              child: Text(
                translate(value.name),
                style: TextStyle(color: colorScheme.onPrimaryContainer),
              ),
            )
          : TextButton(
              onPressed: () {
                // controller.selectIndex(value.index);
                ref
                    .read(chartCreationNotifierProvider.notifier)
                    .updateGender(value);
              },
              child: Text(translate(value.name))),
      // options: GroupButtonOptions(borderRadius: BorderRadius.circular(24)),
    );
  }
}
