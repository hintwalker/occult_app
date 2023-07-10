import 'package:in_app_purchase/in_app_purchase.dart';

bool isPurchaseDone(PurchaseDetails purchase) =>
    purchase.status == PurchaseStatus.purchased;
