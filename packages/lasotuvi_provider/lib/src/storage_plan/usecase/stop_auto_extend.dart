import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../../auth/usecase/take_current_user_provider.dart';
import '../../subscription/repository/current_sub_cache_repository.dart';

final stopAutoExtendProvider = Provider.autoDispose<AutoExtends>(
  (ref) => AutoExtends(
    takeCurrentUser: ref.read(takeCurrentUserProvider),
    currentSubscriptionRepository: ref.read(currentSubCacheRepositoryProvider),
  ),
);
