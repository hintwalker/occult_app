import 'package:in_app_purchase/in_app_purchase.dart';

import '../purchase_repository.dart';

class VerifyPurchase {
  final PurchaseRepository repository;
  const VerifyPurchase(this.repository);
  Future<bool> call(PurchaseDetails purchase) async {
    return await repository.verifyPurchase(purchase);
  }
}
