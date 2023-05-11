part of tauari_purchase;

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
