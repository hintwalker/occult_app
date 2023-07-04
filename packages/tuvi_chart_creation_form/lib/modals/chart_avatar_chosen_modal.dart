part of tuvi_chart_creation_form;

class ChartAvatarChosenModal extends ConsumerWidget {
  const ChartAvatarChosenModal({
    super.key,
    required this.controller,
    required this.translate,
  });

  final ChartAvatarController controller;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(chartCreationNotifierProvider);
    return BasicDialog(title: translate('selectAvatar'), children: [
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: ChartAvatarChosenWidget(
          controller: controller,
          translate: translate,
        ),
      )
    ]);
  }
}
