import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';

// import '../repository/note_cloud_firestore_repository.dart';

final deleteNoteRangeOnCloud = Provider(
  (ref) => DeleteNoteRangeOnCloud(
    cacheRepository: ref.read(
      noteCloudCacheRepositoryProvider,
    ),
    // cloudRepository: ref.read(
    //   noteCloudFirestoreRepositoryProvider,
    // ),
  ),
);
