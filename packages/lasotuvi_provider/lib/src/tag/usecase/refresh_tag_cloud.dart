import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../service/tag_cache_service.dart';

final refreshTagCloudProvider = Provider(
  (ref) => RefreshCache(
    ref.read(
      tagCacheServiceProvider,
    ),
  ),
);
