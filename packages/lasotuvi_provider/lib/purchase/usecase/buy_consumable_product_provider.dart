part of lasotuvi_provider;

final buyConsumableProductProvider = Provider.autoDispose<BuyConsumableProduct>(
    (ref) => BuyConsumableProduct(ref.read(purchaseRepositoryProvider)));
