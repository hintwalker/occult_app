part of tauari_purchase;

bool isPurchaseRestored(PurchaseDetails purchase) =>
    purchase.status == PurchaseStatus.restored;
