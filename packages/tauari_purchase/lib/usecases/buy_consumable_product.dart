part of tauari_purchase;

class BuyConsumableProduct {
  final PurchaseRepository repository;
  const BuyConsumableProduct(this.repository);
  Future<bool> call(ProductDetails productDetails) async {
    late PurchaseParam purchaseParam;
    if (Platform.isAndroid) {
      purchaseParam = GooglePlayPurchaseParam(
        productDetails: productDetails,
        changeSubscriptionParam: null,
      );
    } else {
      purchaseParam = PurchaseParam(
        productDetails: productDetails,
      );
    }
    return await repository.buyConsumable(purchaseParam);
  }
}
