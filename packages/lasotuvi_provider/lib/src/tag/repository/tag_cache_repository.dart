import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import 'tag_cloud_cache_repository.dart';
import 'tag_local_repository.dart';

final tagCacheRepositoryProvider = Provider.autoDispose<TagRepositoryImpl>(
  (ref) => TagRepositoryImpl(
      localRepository: ref.read(tagLocalRepositoryProvider),
      cloudRepository: ref.read(tagCloudCacheRepositoryProvider)),
);
