import 'package:flutter/material.dart';
import 'package:lasotuvi_ads/lasotuvi_ads.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show AppConfig, MarketBody;
import 'package:lasotuvi_style/lasotuvi_style.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({
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
      child: Column(children: [
        if (AppConfig.showAds) const BannerAds(id: AndroidAdsIds.banner),
        if (AppConfig.showAds)
          const SizedBox(
            height: 2.0,
          ),
        Expanded(
          child: Container(
            color: LasotuviAppStyle.colorScheme.background,
            child: const MarketBody(),
          ),
        )
        // Center(
        //   child: FilledButton(
        //       onPressed: () => drawerController.setScreenId('home'),
        //       child: const Text('Go to Home')),
        // )
      ]),
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
