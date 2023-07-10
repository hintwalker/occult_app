import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_utils/tauari_utils.dart';

import '../../auth/current_user_provider.dart';
import '../../purchase/usecase/available_for_sell_provider.dart';
import '../../purchase/usecase/buy_consumable_product_provider.dart';
import '../../purchase/usecase/post_resolve_purchase_provider.dart';
import '../../purchase/usecase/query_product_details_provider.dart';
import '../../purchase/usecase/subscribe_purchase_listing_changes_provider.dart';
import '../usecase/plus_energy_provider.dart';
import '../usecase/take_energy_provider.dart';

final energyStoreControllerProvider =
    ChangeNotifierProvider.autoDispose<EnergyStoreController>(
  (ref) => EnergyStoreController(
      queryProductDetails: ref.read(queryProductDetailsProvider),
      availableForSell: ref.read(availableForSellProvider),
      buyConsumableProduct: ref.read(buyConsumableProductProvider),
      productIds: ProductIds.availableList().map((e) => e.name),
      postResolvePurchase: ref.read(postResolvePurchaseProvider),
      subscribePurchaseListingChanges:
          ref.read(subscribePurchaseListingChangesProvider),
      availableNetwork: availableNetwork,
      getUid: () async {
        final user = ref.read(currentUserProvider);
        return user?.uidInFirestore;
      },
      plusEnergy: ref.read(plusEnergyProvider),
      takeEnergy: ref.read(takeEnergyProvider)),
);
