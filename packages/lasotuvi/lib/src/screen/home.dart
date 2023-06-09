import 'package:flutter/material.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart' show HomeBody;
import 'package:lasotuvi_style/lasotuvi_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    this.restorationId,
    // required this.drawerController,
  });
  final String? restorationId;
  // final TauariDrawerController drawerController;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
      restorationId: restorationId,
      child: Container(
          decoration: BoxDecoration(
            color: LasotuviAppStyle.colorScheme.background,
          ),
          child: const HomeBody()),
      // Center(
      //   child: FilledButton(
      //       onPressed: () => drawerController.setScreenId('energyMarket'),
      //       child: const Text('Go to Energy market')),
      // )
    );
  }
  // const HomeScreen({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: const [
  //       Placeholder(
  //         fallbackHeight: 50.0,
  //       ),
  //       HomeScreenBody()
  //     ],
  //   );
  // }
}
