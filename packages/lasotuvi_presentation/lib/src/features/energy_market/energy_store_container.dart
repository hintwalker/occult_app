import 'package:energy_store/energy_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_ads/lasotuvi_ads.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';

class EnergyStoreContainer extends ConsumerStatefulWidget {
  const EnergyStoreContainer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      EnergyStoreContainerState();
}

class EnergyStoreContainerState
    extends UserAuthDependedState<EnergyStoreContainer> {
  final adsManager = RewardedAdsManager();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(energyStoreControllerProvider.notifier).initStore();
      await adsManager.createRewardedAd(AndroidAdsIds.reward1Energy);
    });
  }

  @override
  Widget build(BuildContext context) {
    final initializing = ref.watch(
        energyStoreControllerProvider.select((value) => value.initializing));
    return initializing || findingUid
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12.0,
                    ),
                    OutlinedButton.icon(
                      onPressed: loadRewardAds,
                      icon: Icon(
                        Icons.ondemand_video,
                        color: LasotuviAppStyle.colorScheme.tertiary,
                      ),
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            translate('watchAdsFor'),
                          ),
                          const Icon(Icons.energy_savings_leaf_outlined),
                          const Text('1')
                        ],
                      ),
                    ),
                    Expanded(
                      child: EnergyStoreWidget(
                        products: ref.watch(energyStoreControllerProvider
                            .select((value) => value.products)),
                        colorScheme: LasotuviAppStyle.colorScheme,
                        translate: translate,
                        onItemTap: (product) async {
                          await ref
                              .read(energyStoreControllerProvider.notifier)
                              .buy(product);
                        },
                        uid: uid,
                        energyController:
                            ref.watch(energyWidgetControllerProvider),
                        energyStyle: LiveEnergyStyleImpl(),
                      ),
                    ),
                  ],
                ),
              ),
              // if (ref.watch(energyStoreControllerProvider
              //     .select((value) => value.progressing)))
              //   const Center(child: CircularProgressIndicator()),
            ],
          );
  }

  Future<void> loadRewardAds() async {
    await adsManager.showRewardedAd(
      AndroidAdsIds.reward1Energy,
      onEarnedReward: (type, amount) async => await ref
          .read(energyStoreControllerProvider.notifier)
          .onDelivery(amount),
    );
  }
}
