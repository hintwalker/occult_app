import 'dart:io';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

import '../purchase_repository.dart';

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
