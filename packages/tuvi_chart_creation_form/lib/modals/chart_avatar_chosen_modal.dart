part of tuvi_chart_creation_form;

class ChartAvatarChosenModal extends ConsumerWidget {
  final imagePicker = ImagePicker();

  ChartAvatarChosenModal({super.key});

  void pickImage(BuildContext context, WidgetRef ref) async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    ref.read(chartCreationNotifierProvider.notifier).updateAvatar(image?.path);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chartCreationNotifierProvider);
    return SimpleDialog(children: [
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child:
                  // InkWell(
                  //   borderRadius: BorderRadius.circular(18),
                  //   onTap: () => pickImage(context, ref),
                  //   child: Card(
                  //     child:
                  CircleHumanAvatar(
                gender: state.chart.gender.intValue,
                path: state.chart.avatar,
              ),
              //   ),
              // ),
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref
                          .read(chartCreationNotifierProvider.notifier)
                          .updateAvatar('');
                    },
                    child: const Text('Mac dinh')),
                ElevatedButton(
                  onPressed: () => pickImage(context, ref),
                  child: const Text('browse...'),
                ),
              ],
            ),

            // const SizedBox(
            //   height: 24,
            // ),
          ],
        ),
      )
    ]);
  }
}
