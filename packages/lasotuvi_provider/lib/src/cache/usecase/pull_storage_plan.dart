import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

final pullStoragePlanProvider = Provider(
  (ref) => PullStoragePlan(
    cacheRepository: ref.read(
      storagePlanCacheRepositoryProvider,
    ),
    // cloudRepository: ref.read(
    //   storagePlanFirestoreRepositoryProvider,
    // ),
  ),
);
