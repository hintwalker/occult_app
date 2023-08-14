import 'package:flutter/material.dart';
import 'package:lasotuvi_ads/lasotuvi_ads.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';

class AllTagsScreen extends StatelessWidget {
  const AllTagsScreen({
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
            Expanded(
              child: AllTagListBody(),
            ),
          ],
        ),
      ),
    );
  }
}
