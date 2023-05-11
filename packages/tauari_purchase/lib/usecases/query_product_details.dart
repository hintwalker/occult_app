part of tauari_purchase;

class QueryProductDetails {
  const QueryProductDetails(this.repository);
  final PurchaseRepository repository;
  Future<ProductDetailsResponse> call(Iterable<String> productIds) async {
    return await repository.queryProductDetails(productIds.toSet());
  }
}
