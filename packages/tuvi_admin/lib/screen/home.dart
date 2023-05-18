part of '../main.dart';

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
        restorationId: restorationId, child: const HomeScreenBody()
        // Center(
        //   child: FilledButton(
        //       onPressed: () => drawerController.setScreenId('energyMarket'),
        //       child: const Text('Go to Energy market')),
        // )
        );
  }
}
