import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'energy_store_container.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';

import '../navigation/drawer_ids.dart';

class MarketBody extends ConsumerStatefulWidget {
  const MarketBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EnergyMarketScreenBodyState();
}

class _EnergyMarketScreenBodyState extends ConsumerState<MarketBody> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        ref.read(mainDrawerControllerProvider).setScreenId(DrawerIds.home);
        return Future.value(false);
      },
      child: const EnergyStoreContainer(),
    );
    // return state.maybeWhen(
    //   data: (data) {
    //     return Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 12.0),
    //       child: EnergyStoreWidget(
    //           products: data.products,
    //           colorScheme: lightColorScheme,
    //           translate: (text) => text,
    //           onItemTap: (product) async {
    //             await ref
    //                 .read(energyStoreControllerProvider.notifier)
    //                 .buy(product);
    //           }),
    //     );
    //   },
    //   orElse: () {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
  }
}
