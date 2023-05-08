part of tauari_purchase;

class ConsumePurchase {
  final PurchaseRepository repository;
  const ConsumePurchase(this.repository);
  Future<void> call(PurchaseDetails purchase) async {
    await repository.consumePurchase(purchase);
  }
}
