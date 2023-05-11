part of lasotuvi_provider;

final queryProductDetailsProvider = Provider.autoDispose<QueryProductDetails>(
    (ref) => QueryProductDetails(ref.read(purchaseRepositoryProvider)));
