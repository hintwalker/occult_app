import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

final pullCurrentSubProvider = Provider(
  (ref) => PullCurrentSubscription(
    cacheRepository: ref.read(
      currentSubCacheRepositoryProvider,
    ),
    // cloudRepository: ref.read(
    //   currentSubFirestoreRepositoryProvider,
    // ),
  ),
);
