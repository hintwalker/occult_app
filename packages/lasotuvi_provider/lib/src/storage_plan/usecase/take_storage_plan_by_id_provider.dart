import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../../auth/usecase/take_current_user_provider.dart';
import '../repository/storage_plan_cache_repository.dart';

final takeStoragePlanByIdProvider = Provider.autoDispose<TakeStoragePlanById>(
  (ref) => TakeStoragePlanById(
    repository: ref.read(
      storagePlanCacheRepositoryProvider,
    ),
    takeCurrentUser: ref.read(
      takeCurrentUserProvider,
    ),
  ),
);
