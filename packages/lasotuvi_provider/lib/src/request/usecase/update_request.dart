import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/request_cache_repository.dart';
// import '../repository/request_firetore_repository.dart';

final updateRequestProvider = Provider.autoDispose<UpdateRequest>(
  (ref) => UpdateRequest(
    cacheRepository: ref.read(requestCacheRepositoryProvider),
    // cloudRepository: ref.read(requestFirestoreRepositoryProvider),
  ),
);
