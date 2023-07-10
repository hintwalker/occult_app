import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';

import '../purchase_repository.dart';

class SubscribePurchaseListingChanges {
  final PurchaseRepository repository;

  const SubscribePurchaseListingChanges(this.repository);

  StreamSubscription<List<PurchaseDetails>> call(
    void Function(List<PurchaseDetails>)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      repository.subcribe(onData,
          onError: onError, onDone: onDone, cancelOnError: cancelOnError);
}
