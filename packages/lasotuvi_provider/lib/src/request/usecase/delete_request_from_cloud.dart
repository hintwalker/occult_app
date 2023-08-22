import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
// import 'package:lasotuvi_provider/src/request/repository/request_cloud_firetore_repository.dart';

import '../repository/request_cloud_cache_repository.dart';

final deleteRequestFromCloudProvider =
    Provider.autoDispose<DeleteRequestFromCloud>(
  (ref) => DeleteRequestFromCloud(
    cacheRepository: ref.read(requestCloudCacheRepositoryProvider),
    // cloudRepository: ref.read(requestCloudFirestoreRepositoryProvider),
  ),
);
