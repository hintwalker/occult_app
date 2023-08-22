import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_source/last_canceled_sub_cache_data_source.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../data_source/last_canceled_sub_firestore_data_source.dart';

final lastCanceledSubCacheRepositoryProvider =
    Provider.autoDispose<LastCanceledSubscriptionRepository>(
  (ref) => LastCanceledSubscriptionRepositoryImpl(
    ref.read(lastCanceledSubCacheDataSourceProvider),
    onlineDataSource: ref.read(lastCanceledSubFirestoreDataSourceProvider),
  ),
);
