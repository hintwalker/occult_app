import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/tag_cache_repository.dart';

final onCountTagProvider = Provider(
  (ref) => OnCountTag(
    ref.read(tagCacheRepositoryProvider),
  ),
);
