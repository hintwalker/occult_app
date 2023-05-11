part of tauari_purchase;

class AvailableForSell {
  final PurchaseRepository repository;

  const AvailableForSell(this.repository);

  Future<bool> call() => repository.isAvailable();
}
