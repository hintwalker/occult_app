import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

final pullNoteProvider = Provider(
  (ref) => PullNote(
    cacheRepository: ref.read(
      noteCloudCacheRepositoryProvider,
    ),
    // cloudRepository: ref.read(
    //   noteCloudFirestoreRepositoryProvider,
    // ),
  ),
);
