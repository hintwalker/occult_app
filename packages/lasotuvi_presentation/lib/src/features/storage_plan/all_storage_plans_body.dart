import 'package:energy_store/energy_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_utils/tauari_utils.dart';
import 'package:tuvi_style/tuvi_style.dart';

import '../../styles/storage_plan_style_impl.dart';
import '../auth/user_auth_depended_state.dart';

class AllStoragePlansBody extends ConsumerStatefulWidget {
  const AllStoragePlansBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AllStoragePlansBodyState();
}

class _AllStoragePlansBodyState
    extends UserAuthDependedState<AllStoragePlansBody> {
  // @override
  // void dispose() {
  //   ref.read(expiredTimerControllerProvider).cancelAllTimer();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(currentSubControllerProvider).dataStream(uid),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.requireData;
            final activedId = data == null
                ? StoragePlanIds.free
                : data.status == SubscriptionStatus.canceled
                    ? StoragePlanIds.free
                    : data.packageId;
            final previousId = data?.packageId;
            final style = StoragePlanStyleImpl();

            return LiveStoragePlanListWidget(
              uid: uid,
              activedPlanId: activedId,
              previousPlanId: previousId,
              controller: ref.read(storagePlanListControllerProvider),
              translate: translate,
              energyIcon: EnergyIcon(
                  color: lightColorScheme.primary, size: style.energyIconSize),
              style: style,
              expiredTimerController: ref.read(expiredTimerControllerProvider),
              currentSubController: ref.read(currentSubControllerProvider),
            );
          } else {
            return const Center(child: SimpleErrorWidget());
          }
        });
  }
}
