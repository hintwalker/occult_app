import 'package:flutter/material.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show EnergyMarketScreenBody;

class EnergyMarketScreen extends StatelessWidget {
  const EnergyMarketScreen({
    super.key,
    this.restorationId,
    // required this.drawerController,
  });
  final String? restorationId;
  // final TauariDrawerController drawerController;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
        restorationId: restorationId, child: const EnergyMarketScreenBody()
        // Center(
        //   child: FilledButton(
        //       onPressed: () => drawerController.setScreenId('home'),
        //       child: const Text('Go to Home')),
        // )
        );
  }
}


// class EnergyMarketScreen extends StatelessWidget {
//   const EnergyMarketScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: const [
//         Placeholder(
//           fallbackHeight: 50.0,
//         ),
//         Expanded(child: EnergyMarketScreenBody())
//       ],
//     );
//   }
// }
