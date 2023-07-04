part of tuvi_chart_creation_form;

class ChartAvatarChosenWidget extends ConsumerStatefulWidget {
  ChartAvatarChosenWidget({
    super.key,
    required this.controller,
    required this.translate,
  });
  final ChartAvatarController controller;
  final String Function(String) translate;
  final imagePicker = ImagePicker();

  void pickImage(
      BuildContext context, WidgetRef ref, Function() callback) async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    controller.onChanged(image?.path, true);
    callback();
    // ref.read(chartCreationNotifierProvider.notifier).updateAvatar(image?.path);
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChartAvatarChosenState();
}

class _ChartAvatarChosenState extends ConsumerState<ChartAvatarChosenWidget> {
  String? avatar;
  @override
  void initState() {
    super.initState();
    updateAvatar();
  }

  void updateAvatar() {
    setState(() {
      avatar = widget.controller.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            gender: widget.controller.initGender.intValue,
            path: avatar,
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
                  widget.controller.onChanged('', true);
                  updateAvatar();
                  // ref
                  //     .read(chartCreationNotifierProvider.notifier)
                  //     .updateAvatar('');
                },
                child: Text(widget.translate('default'))),
            ElevatedButton(
              onPressed: () => widget.pickImage(context, ref, updateAvatar),
              child: Text(
                widget.translate(
                  'browse...',
                ),
              ),
            ),
          ],
        ),

        // const SizedBox(
        //   height: 24,
        // ),
      ],
    );
  }
}
