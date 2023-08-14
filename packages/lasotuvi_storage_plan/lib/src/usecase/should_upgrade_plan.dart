import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

bool shouldUpgradePlan(
  StoragePlan? storagePlan,
) =>
    storagePlan?.id != StoragePlanIds.max;
