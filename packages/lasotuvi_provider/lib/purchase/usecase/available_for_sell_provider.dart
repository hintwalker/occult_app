part of lasotuvi_provider;

final availableForSellProvider = Provider.autoDispose<AvailableForSell>(
    (ref) => AvailableForSell(ref.read(purchaseRepositoryProvider)));
