import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/commentary_cache_repostiory.dart';
// import '../repository/commentary_firestore_repostiory.dart';

final uploadCommentaryProvider = Provider.autoDispose<UploadCommentary>(
  (ref) => UploadCommentary(
    cacheRepository: ref.read(commentaryCacheRepositoryProvider),
    // cloudRepository: ref.read(commentaryFirestoreRepositoryProvider),
  ),
);
