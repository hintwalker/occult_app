import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:tauari_purchase/tauari_purchase.dart';

final purchaseDataSourceProvider = Provider((ref) => PurchaseDataSource(
      InAppPurchase.instance,
      productValue: (productId) => ProductIds.fromProductId(productId).point,
    ));
