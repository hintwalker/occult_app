part of lasotuvi_provider;

final purchaseDataSourceProvider = Provider((ref) => PurchaseDataSource(
      InAppPurchase.instance,
      productValue: (productId) => ProductIds.fromProductId(productId).point,
    ));
