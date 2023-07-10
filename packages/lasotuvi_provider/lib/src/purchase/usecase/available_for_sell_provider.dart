import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_purchase/tauari_purchase.dart';

import '../purchase_repository_provider.dart';

final availableForSellProvider = Provider.autoDispose<AvailableForSell>(
    (ref) => AvailableForSell(ref.read(purchaseRepositoryProvider)));
