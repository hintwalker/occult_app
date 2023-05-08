part of tauari_purchase;

bool isPurchaseError(PurchaseDetails purchase) =>
    purchase.status == PurchaseStatus.error;
