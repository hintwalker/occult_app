part of lasotuvi_provider;

final subscribePurchaseListingChangesProvider =
    Provider.autoDispose<SubscribePurchaseListingChanges>((ref) =>
        SubscribePurchaseListingChanges(ref.read(purchaseRepositoryProvider)));
