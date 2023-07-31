import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

final makeCurrentSubscriptionExpiredProvider = Provider(
  (ref) => MakeCurrentSubscriptionExpired(
    takeCurrentUser: ref.read(takeCurrentUserProvider),
    updateCurrentSubscription: ref.read(updateCurrentSubProvider),
  ),
);
