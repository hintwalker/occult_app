import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/src/purchase/purchase_data_source_provider.dart';
import 'package:tauari_purchase/tauari_purchase.dart';

final purchaseRepositoryProvider =
    Provider((ref) => PurchaseRepository(ref.read(purchaseDataSourceProvider)));
