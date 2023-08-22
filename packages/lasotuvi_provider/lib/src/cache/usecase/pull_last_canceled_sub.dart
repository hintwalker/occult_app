import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

import '../../subscription/repository/last_canceled_sub_cache_repository.dart';

final pullLastCanceledSubProvider = Provider(
  (ref) => PullLastCanceledSubscription(
    cacheRepository: ref.read(
      lastCanceledSubCacheRepositoryProvider,
    ),
    // cloudRepository: ref.read(
    //   lastCanceledSubFirestoreRepositoryProvider,
    // ),
  ),
);
