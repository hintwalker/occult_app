import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_utils/tauari_utils.dart';

import '../../auth/usecase/take_current_user_provider.dart';
import '../../subscription/usecase/extends_subscription_provider.dart';
import '../../subscription/usecase/subscribe_plan_provider.dart';
import '../../subscription/usecase/unsubscribe_plan_provider.dart';
import '../usecase/take_all_storage_plans_provider.dart';

final storagePlanListControllerProvider =
    ChangeNotifierProvider.autoDispose<StoragePlanListController>(
        (ref) => StoragePlanListController(
              takeAllStoragePlans: ref.read(takeAllStoragePlansProvider),
              subscribePlan: ref.read(subscribePlanProvider),
              unSubscribePlan: ref.read(unSubscribePlanProvider),
              extendsSubscription: ref.read(extendsSubscriptionProvider),
              takeCurrentUser: ref.read(takeCurrentUserProvider),
              hasConnection: availableNetwork,
            ));
