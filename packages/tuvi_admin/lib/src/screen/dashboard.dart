import 'package:flutter/material.dart';
import 'package:tuvi_admin_presentation/tuvi_admin_presentation.dart';
// import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
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
      child: const DashboardScreenBody(),
    );
    // RestorationScope(restorationId: restorationId, child: const HomeBody()
    // Center(
    //   child: FilledButton(
    //       onPressed: () => drawerController.setScreenId('energyMarket'),
    //       child: const Text('Go to Energy market')),
    // )
    // );
  }
}
