import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../../subscription/usecase/take_current_sub_provider.dart';
import 'take_storage_plan_by_id_provider.dart';

final takeCurrentStoragePlanProvider =
    Provider.autoDispose<TakeCurrentStoragePlan>(
  (ref) => TakeCurrentStoragePlan(
    takeCurrentSubscription: ref.read(
      takeCurrentSubProvider,
    ),
    takeStoragePlanById: ref.read(
      takeStoragePlanByIdProvider,
    ),
  ),
);
