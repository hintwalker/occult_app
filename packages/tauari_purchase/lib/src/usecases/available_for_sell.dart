import '../purchase_repository.dart';

class AvailableForSell {
  final PurchaseRepository repository;

  const AvailableForSell(this.repository);

  Future<bool> call() => repository.isAvailable();
}
