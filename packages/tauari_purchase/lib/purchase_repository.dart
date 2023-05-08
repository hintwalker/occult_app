part of tauari_purchase;

class PurchaseRepository {
  final PurchaseDataSource dataSource;
  const PurchaseRepository(this.dataSource);

  // Set<String> get productIds => dataSource.productIds;
  Stream<List<PurchaseDetails>> getPurchases() => dataSource.getPurchases();
  StreamSubscription<List<PurchaseDetails>> subcribe(
    void Function(List<PurchaseDetails>)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      dataSource.subcribe(
        onData,
        onError: onError,
        onDone: onDone,
        cancelOnError: cancelOnError,
      );
  Future<bool> isAvailable() async => dataSource.isAvailable();

  Future<ProductDetailsResponse> queryProductDetails(
          Set<String> productIds) async =>
      dataSource.queryProductDetails(productIds);

  Future<bool> buyConsumable(PurchaseParam purchaseParam) async =>
      dataSource.buyConsumable(purchaseParam);

  Future<void> consumePurchase(PurchaseDetails purchaseDetails) async =>
      dataSource.consumePurchase(purchaseDetails);

  Future<void> completePurchase(PurchaseDetails purchaseDetails) async =>
      dataSource.completePurchase(purchaseDetails);

  Future<bool> verifyPurchase(PurchaseDetails purchaseDetails) async =>
      dataSource.verifyPurchase(purchaseDetails);

  int productValue(String productID) => dataSource.productValue(productID);
}
