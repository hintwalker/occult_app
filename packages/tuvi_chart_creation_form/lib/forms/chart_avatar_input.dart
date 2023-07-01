part of tuvi_chart_creation_form;

class ChartAvatarInput extends ConsumerWidget {
  ChartAvatarInput({super.key});
  final imagePicker = ImagePicker();

  void showModal(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) =>
            // Material(child:
            ChartAvatarChosenModal()
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
          onTap: () => showModal(context),
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
