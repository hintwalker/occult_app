import 'package:flutter/material.dart';
import 'package:lasotuvi_ads/lasotuvi_ads.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show AppConfig, HomeBody;
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
        child: const Column(
          children: [
            if (AppConfig.showAds) BannerAds(id: AndroidAdsIds.banner),
            if (AppConfig.showAds)
              SizedBox(
                height: 2.0,
              ),
            Expanded(
              child: HomeBody(),
            ),
          ],
        ),
      ),
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
