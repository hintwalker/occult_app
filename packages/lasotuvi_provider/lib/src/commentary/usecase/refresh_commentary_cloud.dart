import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../service/commentary_cache_service.dart';

final refreshCommentaryCloudProvider = Provider(
  (ref) => RefreshCache(
    ref.read(
      commentaryCacheServiceProvider,
    ),
  ),
);
