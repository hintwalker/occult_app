part of tauari_purchase;

bool isPurchaseDone(PurchaseDetails purchase) =>
    purchase.status == PurchaseStatus.purchased;
