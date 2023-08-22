import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
// import 'package:lasotuvi_provider/src/tag/repository/tag_cloud_firestore_repository.dart';

final deleteTagRangeOnCloud = Provider(
  (ref) => DeleteTagRangeOnCloud(
    cacheRepository: ref.read(
      tagCloudCacheRepositoryProvider,
    ),
    // cloudRepository: ref.read(
    //   tagCloudFirestoreRepositoryProvider,
    // ),
  ),
);
