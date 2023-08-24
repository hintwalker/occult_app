import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../commentary/repository/commentary_and_request/cmtry_req_cache_repository.dart';

final requestByCommentaryIdProvider =
    Provider.autoDispose<RequestByCommentaryId>(
  (ref) => RequestByCommentaryId(
      ref.read(commentaryAndRequestCacheRepositoryProvider)),
);
