part of energy_store;

class LiveEnergyWidget extends StatelessWidget {
  const LiveEnergyWidget(
      {super.key,
      // this.iconColor,
      // required this.textStyle,
      required this.controller,
      required this.style,
      this.uid});
  final LiveEnergyStyle style;
  // final Color? iconColor;
  // final TextStyle textStyle;
  // final Widget text;
  final EnergyWidgetController controller;
  final String? uid;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Container(
          constraints: const BoxConstraints(minWidth: 58.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EnergyIcon(
                color: style.iconColor,
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
                        style: style.textStyle,
                      );
                    } else {
                      return const Center(
                        child: Text('!'),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
