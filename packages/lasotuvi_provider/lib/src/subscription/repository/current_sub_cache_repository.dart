import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../data_source/current_sub_cache_data_source.dart';
import '../data_source/current_sub_firestore_data_source.dart';

final currentSubCacheRepositoryProvider =
    Provider<CurrentSubscriptionRepository>(
  (ref) => CurrentSubRepositoryImpl(
    ref.read(currentSubCacheDataSourceProvider),
    onlineDataSource: ref.read(currentSubFirestoreDataSourceProvider),
  ),
);
