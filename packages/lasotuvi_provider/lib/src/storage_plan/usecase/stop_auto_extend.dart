import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../../auth/usecase/take_current_user_provider.dart';
import '../../subscription/repository/current_sub_repository_provider.dart';

final stopAutoExtendProvider = Provider.autoDispose<StopAutoExtends>(
  (ref) => StopAutoExtends(
    takeCurrentUser: ref.read(takeCurrentUserProvider),
    currentSubscriptionRepository: ref.read(currentSubRepositoryProvider),
  ),
);
