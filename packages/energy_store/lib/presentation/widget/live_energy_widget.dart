part of energy_store;

class LiveEnergyWidget extends StatelessWidget {
  const LiveEnergyWidget(
      {super.key,
      this.iconColor,
      required this.textStyle,
      required this.controller,
      this.uid});
  final Color? iconColor;
  final TextStyle textStyle;
  // final Widget text;
  final EnergyWidgetController controller;
  final String? uid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EnergyIcon(
          color: iconColor,
        ),
        StreamBuilder(
            initialData: const Energy(0),
            stream: controller.energyStream(uid),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                return Text(
                  snapshot.data?.value.toString() ?? '0',
                  style: textStyle,
                );
              } else {
                return const Center(
                  child: Text('!'),
                );
              }
            })
      ],
    );
  }
}
