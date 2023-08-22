import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
// import 'package:lasotuvi_provider/src/commentary/repository/commentary_cloud_firestore_repository.dart';

import '../repository/commentary_cloud_cache_repository.dart';

final deleteCommentaryFromCloudProvider =
    Provider.autoDispose<DeleteCommentaryFromCloud>(
  (ref) => DeleteCommentaryFromCloud(
    cacheRepository: ref.read(commentaryCloudCacheRepositoryProvider),
    // cloudRepository: ref.read(commentaryCloudFirestoreRepositoryProvider),
  ),
);
