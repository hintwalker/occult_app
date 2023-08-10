import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

final subscriptionConfirmNotifierProvider = StateNotifierProvider<
    SubscriptionConfirmNotifier, SubscriptionConfirmState>(
  (ref) => SubscriptionConfirmNotifier(
    takeCurrentStoragePlan: ref.read(takeCurrentStoragePlanProvider),
    countChartOnCloud: ref.read(countChartOnCloudProvider),
    countNoteOnCloud: ref.read(countNoteOnCloudProvider),
    countTagOnCloud: ref.read(countTagOnCloudProvider),
    enoughEnergy: ref.read(enoughEnergyProvider),
  ),
);
