import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_ads/lasotuvi_ads.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_auth_widget/tauari_auth_widget.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../config/app_config.dart';
import '../auth/user_auth_depended_state.dart';

class StarInfoBody extends ConsumerStatefulWidget {
  const StarInfoBody(this.item, {super.key});
  final StarItem item;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StarInfoBodyState();
}

class _StarInfoBodyState extends UserAuthDependedState<StarInfoBody> {
  @override
  Widget build(BuildContext context) {
    return StarInfoModal(
      title: translate(widget.item.label),
      colorScheme: LasotuviAppStyle.colorScheme,
      child: findingUid
          ? const LoadingWidget()
          : uid == null
              ? Center(
                  child: GoogleSignInButton(
                      onTap: () => ref.read(signInWithGoogleProvider).call(),
                      title: translate('signIn')),
                )
              : Column(
                  children: [
                    if (AppConfig.showAds)
                      const BannerAds(id: AndroidAdsIds.banner),
                    Expanded(
                      child: StarInfoViewer(
                        widget.item.name,
                        uid: uid!,
                        controller: ref.watch(starInfoViewerControllerProvider),
                        colorScheme: LasotuviAppStyle.colorScheme,
                        translate: translate,
                      ),
                    ),
                  ],
                ),
    );
  }
}
