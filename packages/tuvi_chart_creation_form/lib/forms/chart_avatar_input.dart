part of tuvi_chart_creation_form;

class ChartAvatarInput extends ConsumerWidget {
  ChartAvatarInput({
    super.key,
    required this.translate,
  });
  final String Function(String) translate;
  final imagePicker = ImagePicker();

  void showModal({
    required BuildContext context,
    required String? initAvatar,
    required Gender initGender,
    required WidgetRef ref,
  }) {
    showDialog(
        context: context,
        builder: (ctx) =>
            // Material(child:
            ChartAvatarChosenModal(
              translate: translate,
              controller: ChartAvatarController(
                  value: initAvatar,
                  updateValid: (value) => ref
                      .read(chartCreationNotifierProvider.notifier)
                      .updateValid(value),
                  updateValue: (value) => ref
                      .read(chartCreationNotifierProvider.notifier)
                      .updateAvatar(value),
                  initGender: initGender),
            )
        // )
        );
    // showModalBottomSheet(
    //     context: context, builder: (ctx) => ChartAvatarChosenModal());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chartCreationNotifierProvider);
    return SizedBox(
      width: 128,
      height: 128,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () => showModal(
            context: context,
            initAvatar: state.chart.avatar,
            initGender: state.chart.gender,
            ref: ref,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircleHumanAvatar(
              gender: state.chart.gender.intValue,
              path: state.chart.avatar,
              size: 64.0,
            ),
          ),
        ),
      ),
    );
  }
}
