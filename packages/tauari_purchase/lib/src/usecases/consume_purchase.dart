import 'package:in_app_purchase/in_app_purchase.dart';

import '../purchase_repository.dart';

class ConsumePurchase {
  final PurchaseRepository repository;
  const ConsumePurchase(this.repository);
  Future<void> call(PurchaseDetails purchase) async {
    await repository.consumePurchase(purchase);
  }
}
