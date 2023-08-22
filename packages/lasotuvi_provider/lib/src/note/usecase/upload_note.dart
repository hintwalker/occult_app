import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/note_cache_repostiory.dart';
// import '../repository/note_firestore_repository.dart';

final uploadNoteProvider = Provider.autoDispose<UploadNote>(
  (ref) => UploadNote(
    cacheRepository: ref.read(noteCacheRepositoryProvider),
    // cloudRepository: ref.read(noteFirestoreRepositoryProvider),
  ),
);
