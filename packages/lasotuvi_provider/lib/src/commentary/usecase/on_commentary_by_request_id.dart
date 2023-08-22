import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/commentary_and_request/commentary_and_request_cache_repository.dart';

final onCommentaryByRequestIdProvider =
    Provider.autoDispose<OnCommentaryByRequestId>(
  (ref) => OnCommentaryByRequestId(
      ref.read(commentaryAndRequestCacheRepositoryProvider)),
);
