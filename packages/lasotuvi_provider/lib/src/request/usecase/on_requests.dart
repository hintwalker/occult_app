import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/request_cache_repository.dart';

final onRequestsProvider = Provider.autoDispose<OnRequests>(
    (ref) => OnRequests(ref.read(requestCacheRepositoryProvider)));
