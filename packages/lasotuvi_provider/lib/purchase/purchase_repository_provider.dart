part of lasotuvi_provider;

final purchaseRepositoryProvider =
    Provider((ref) => PurchaseRepository(ref.read(purchaseDataSourceProvider)));
