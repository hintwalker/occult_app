import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
// import 'package:lasotuvi_provider/src/tag/repository/tag_cloud_firestore_repository.dart';

import '../repository/tag_cloud_cache_repository.dart';

final deleteTagFromCloudProvider = Provider.autoDispose<DeleteTagFromCloud>(
  (ref) => DeleteTagFromCloud(
    cacheRepository: ref.read(tagCloudCacheRepositoryProvider),
    // cloudRepository: ref.read(tagCloudFirestoreRepositoryProvider),
  ),
);
