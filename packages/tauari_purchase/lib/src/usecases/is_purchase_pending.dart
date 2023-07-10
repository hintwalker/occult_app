import 'package:in_app_purchase/in_app_purchase.dart';

bool isPurchasePending(PurchaseDetails purchase) =>
    purchase.status == PurchaseStatus.pending;
