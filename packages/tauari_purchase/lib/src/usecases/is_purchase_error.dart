import 'package:in_app_purchase/in_app_purchase.dart';

bool isPurchaseError(PurchaseDetails purchase) =>
    purchase.status == PurchaseStatus.error;
