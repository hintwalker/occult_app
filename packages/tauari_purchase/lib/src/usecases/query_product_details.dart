import 'package:in_app_purchase/in_app_purchase.dart';

import '../purchase_repository.dart';

class QueryProductDetails {
  const QueryProductDetails(this.repository);
  final PurchaseRepository repository;
  Future<ProductDetailsResponse> call(Iterable<String> productIds) async {
    return await repository.queryProductDetails(productIds.toSet());
  }
}
