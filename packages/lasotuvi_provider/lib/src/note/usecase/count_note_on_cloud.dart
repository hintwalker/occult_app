import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/note_cloud_cache_repository.dart';

final countNoteOnCloudProvider = Provider(
  (ref) => CountNoteOnCloud(
    ref.read(
      noteCloudCacheRepositoryProvider,
    ),
  ),
);
