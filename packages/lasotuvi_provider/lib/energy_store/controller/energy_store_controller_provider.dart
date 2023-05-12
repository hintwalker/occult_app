part of lasotuvi_provider;

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
