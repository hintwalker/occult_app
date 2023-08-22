import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/tag_cache_repository.dart';
// import '../repository/tag_firestore_repository.dart';

final updateTagProvider = Provider.autoDispose<UpdateTag>(
  (ref) => UpdateTag(
    cacheRepository: ref.read(tagCacheRepositoryProvider),
    // cloudRepository: ref.read(tagFirestoreRepositoryProvider),
  ),
);
