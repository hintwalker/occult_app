part of tauari_purchase;

class VerifyPurchase {
  final PurchaseRepository repository;
  const VerifyPurchase(this.repository);
  Future<bool> call(PurchaseDetails purchase) async {
    return await repository.verifyPurchase(purchase);
  }
}
