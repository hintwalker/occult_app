import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/tag_cloud_cache_repository.dart';

final countTagOnCloudProvider = Provider(
  (ref) => CountTagOnCloud(
    ref.read(
      tagCloudCacheRepositoryProvider,
    ),
  ),
);
