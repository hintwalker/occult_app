import 'package:flutter/material.dart';
import 'package:lasotuvi_ads/lasotuvi_ads.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show AllStoragePlansBody, AppConfig;
import 'package:lasotuvi_style/lasotuvi_style.dart';

class AllStoragePlansScreen extends StatelessWidget {
  const AllStoragePlansScreen({
    super.key,
    this.restorationId,
  });
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
      restorationId: restorationId,
      child: Container(
        color: LasotuviAppStyle.colorScheme.background,
        child: const Column(
          children: [
            if (AppConfig.showAds) BannerAds(id: AndroidAdsIds.banner),
            if (AppConfig.showAds)
              SizedBox(
                height: 2.0,
              ),
            Expanded(child: AllStoragePlansBody())
          ],
        ),
      ),
    );
  }
}
