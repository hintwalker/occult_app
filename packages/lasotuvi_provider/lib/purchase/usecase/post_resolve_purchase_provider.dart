part of lasotuvi_provider;

final postResolvePurchaseProvider = Provider.autoDispose<PostResolvePurchase>(
    (ref) => PostResolvePurchase(ref.read(purchaseRepositoryProvider)));
