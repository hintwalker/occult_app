part of tuvi_chart_creation_form;

class ChartAvatarInput extends ConsumerWidget {
  ChartAvatarInput({super.key});
  final imagePicker = ImagePicker();

  void showModal(BuildContext context) async {
    await showModalBottomSheet(
        context: context, builder: (ctx) => ChartAvatarChosenModal());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chart = ref.watch(chartCreationNotifierProvider);
    return SizedBox(
      width: 64,
      height: 64,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => showModal(context),
        child: Card(
          child: CircleHumanAvatar(
            gender: chart.gender.intValue,
            path: chart.avatar,
          ),
        ),
      ),
    );
  }
}
