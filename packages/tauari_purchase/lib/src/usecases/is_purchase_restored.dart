import 'package:in_app_purchase/in_app_purchase.dart';

bool isPurchaseRestored(PurchaseDetails purchase) =>
    purchase.status == PurchaseStatus.restored;
