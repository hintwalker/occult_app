part of tauari_purchase;

class PurchaseDataSource {
  final InAppPurchase inAppPurchase;
  const PurchaseDataSource(
    this.inAppPurchase, {
    required this.productValue,
  });
  final int Function(String productId) productValue;

  // Set<String> get productIds =>
  //     ProductIds.availableList().map((e) => e.name).toSet();
  Stream<List<PurchaseDetails>> getPurchases() => inAppPurchase.purchaseStream;

  StreamSubscription<List<PurchaseDetails>> subcribe(
    void Function(List<PurchaseDetails> productDetails)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    final purchaseUpdated = getPurchases();
    return purchaseUpdated.listen(
      onData,
      onDone: onDone,
      onError: onError,
      cancelOnError: cancelOnError,
    );
  }

  Future<bool> isAvailable() => inAppPurchase.isAvailable();

  Future<ProductDetailsResponse> queryProductDetails(Set<String> productIds) =>
      inAppPurchase.queryProductDetails(productIds);

  Future<bool> buyConsumable(PurchaseParam purchaseParam) async =>
      await inAppPurchase.buyConsumable(purchaseParam: purchaseParam);

  Future<void> consumePurchase(PurchaseDetails purchaseDetails) async {
    final InAppPurchaseAndroidPlatformAddition androidAddition = inAppPurchase
        .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
    await androidAddition.consumePurchase(purchaseDetails);
  }

  Future<void> completePurchase(PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.pendingCompletePurchase) {
      await inAppPurchase.completePurchase(purchaseDetails);
    }
  }

  Future<bool> verifyPurchase(PurchaseDetails purchaseDetails) async {
    return Future<bool>.value(true);
  }

  // int valueOf(String productID) => productValue(productID);

  // int energyOf(String productID) {
  //   return ProductIds.values
  //       .firstWhere(
  //         (element) => element.name == productID,
  //         orElse: () => ProductIds.ev0,
  //       )
  //       .point;
  // }
}
