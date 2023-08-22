import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
// import 'package:lasotuvi_provider/src/note/repository/note_cloud_firestore_repository.dart';

import '../repository/note_cloud_cache_repository.dart';

final deleteNoteFromCloudProvider = Provider.autoDispose<DeleteNoteFromCloud>(
  (ref) => DeleteNoteFromCloud(
    cacheRepository: ref.read(noteCloudCacheRepositoryProvider),
    // cloudRepository: ref.read(noteCloudFirestoreRepositoryProvider),
  ),
);
