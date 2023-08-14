import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_provider/src/storage_plan/usecase/cancel_plan.dart';
import 'package:lasotuvi_provider/src/storage_plan/usecase/make_current_subscription_expired.dart';
import 'package:lasotuvi_provider/src/subscription/usecase/has_subscription_canceled.dart';
import 'package:lasotuvi_provider/src/subscription/usecase/has_subscription_expired.dart';
import 'package:lasotuvi_provider/src/utils/check_network_status.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

final verifySubscriptionProvider = Provider(
  (ref) => VerifyCurrentSubscription(
    checkNetworkStatus: ref.read(
      checkNetworkStatusProvider,
    ),
    hasSubscriptionCanceled: ref.read(
      hasSubscriptionCanceledProvider,
    ),
    makeCurrentSubscriptionExpired: ref.read(
      makeCurrentSubscriptionExpiredProvider,
    ),
    cancelPlan: ref.read(
      cancelPlanProvider,
    ),
    hasSubscriptionExpired: ref.read(
      hasSubscriptionExpiredProvider,
    ),
    takeCurrentSubscription: ref.read(
      takeCurrentSubProvider,
    ),
    takeCurrentUser: ref.read(
      takeCurrentUserProvider,
    ),
  ),
);
