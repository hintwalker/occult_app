import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_provider/src/subscription/usecase/update_last_canceled_subscription.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

final cancelPlanProvider = Provider(
  (ref) => CancelPlan(
    updateCurrentSubscription: ref.read(updateCurrentSubProvider),
    updateLastCanceledSubscription: ref.read(
      updateLastCanceledSubscriptionProvider,
    ),
    takeCurrentSubscription: ref.read(takeCurrentSubProvider),
    takeCurrentUser: ref.read(takeCurrentUserProvider),
    deleteExcessData: ref.read(deleteExcessDataProvider),
  ),
);
