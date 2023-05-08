part of tauari_purchase;

bool isPurchasePending(PurchaseDetails purchase) =>
    purchase.status == PurchaseStatus.pending;
