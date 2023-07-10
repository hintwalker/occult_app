import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:tauari_purchase/src/purchase_datasource.dart';

class PurchaseRepository {
  final PurchaseDataSource dataSource;
  const PurchaseRepository(this.dataSource);

  // Set<String> get productIds => dataSource.productIds;
  Stream<List<PurchaseDetails>> getPurchases() => dataSource.getPurchases();
  StreamSubscription<List<PurchaseDetails>> subcribe(
    void Function(List<PurchaseDetails>)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      dataSource.subcribe(
        onData,
        onError: onError,
        onDone: onDone,
        cancelOnError: cancelOnError,
      );
  Future<bool> isAvailable() => dataSource.isAvailable();

  Future<ProductDetailsResponse> queryProductDetails(Set<String> productIds) =>
      dataSource.queryProductDetails(productIds);

  Future<bool> buyConsumable(PurchaseParam purchaseParam) =>
      dataSource.buyConsumable(purchaseParam);

  Future<void> consumePurchase(PurchaseDetails purchaseDetails) =>
      dataSource.consumePurchase(purchaseDetails);

  Future<void> completePurchase(PurchaseDetails purchaseDetails) =>
      dataSource.completePurchase(purchaseDetails);

  Future<bool> verifyPurchase(PurchaseDetails purchaseDetails) =>
      dataSource.verifyPurchase(purchaseDetails);

  int productValue(String productID) => dataSource.productValue(productID);
}
