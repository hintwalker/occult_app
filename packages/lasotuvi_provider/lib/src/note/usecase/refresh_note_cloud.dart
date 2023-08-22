import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../service/note_cache_service.dart';

final refreshNoteCloudProvider = Provider(
  (ref) => RefreshCache(
    ref.read(
      noteCacheServiceProvider,
    ),
  ),
);
