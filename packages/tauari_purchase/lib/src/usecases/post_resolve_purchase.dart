import 'dart:io';

import 'package:in_app_purchase/in_app_purchase.dart';

import '../purchase_repository.dart';
import 'is_purchase_done.dart';
import 'is_purchase_error.dart';
import 'is_purchase_pending.dart';
import 'is_purchase_restored.dart';

class PostResolvePurchase {
  final PurchaseRepository repository;
  const PostResolvePurchase(this.repository);
  Future<void> call(
    List<PurchaseDetails> purchaseDetailsList, {
    required void Function(bool) onPending,
    required void Function(String?) onError,
    required Future<void> Function(int) onDelivery,
  }) async {
    for (var purchaseDetails in purchaseDetailsList) {
      if (isPurchasePending(purchaseDetails)) {
        onPending(true);
      } else {
        await _reviewPurchase(purchaseDetails,
            onDeliver: onDelivery, onError: onError);
        await _consume(purchaseDetails);
        await _completePurchase(purchaseDetails);
      }
    }
  }

  Future<void> _reviewPurchase(
    PurchaseDetails purchase, {
    required void Function(String?) onError,
    required Future<void> Function(int) onDeliver,
  }) async {
    if (isPurchaseError(purchase)) {
      onError(purchase.error?.message);
    } else if (isPurchaseDone(purchase) || isPurchaseRestored(purchase)) {
      await _packageUp(
        purchase,
        onDeliver: onDeliver,
      );
    }
  }

  Future<void> _packageUp(
    PurchaseDetails purchaseDetails, {
    required Future<void> Function(int) onDeliver,
  }) async {
    final bool valid = await repository.verifyPurchase(purchaseDetails);
    if (valid) {
      await _deliver(purchaseDetails, onDeliver: onDeliver);
    } else {
      // handleInvalidPurchase(purchaseDetails);
      return;
    }
  }

  Future<void> _deliver(
    PurchaseDetails product, {
    required Future<void> Function(int) onDeliver,
  }) async {
    final value = repository.productValue(product.productID);
    await onDeliver(value);
    // if (uid != null) {
    //   // final Energy newEnergy = currentEnergy + Energy(energyValue);

    //   await energyRepository.plusEnergy(uid!, energyValue);
    //   // setEnergy(newEnergy);
    // }
  }

  Future<void> _consume(PurchaseDetails purchase) async {
    if (Platform.isAndroid) {
      await repository.consumePurchase(purchase);
    }
  }

  Future<void> _completePurchase(PurchaseDetails purchase) async {
    await repository.completePurchase(purchase);
  }
}
