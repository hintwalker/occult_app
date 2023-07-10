import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_purchase/tauari_purchase.dart';

import '../purchase_repository_provider.dart';

final buyConsumableProductProvider = Provider.autoDispose<BuyConsumableProduct>(
    (ref) => BuyConsumableProduct(ref.read(purchaseRepositoryProvider)));
