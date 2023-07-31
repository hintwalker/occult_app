import 'package:energy_store/energy_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_auth_widget/tauari_auth_widget.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
// import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
// import 'package:tauari_utils/tauari_utils.dart';

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
  final style = StoragePlanStyleImpl();
  late Widget energyIcon;

  // @override
  // void dispose() {
  //   ref.read(expiredTimerControllerProvider).cancelAllTimer();
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
    energyIcon = EnergyIcon(
        color: LasotuviAppStyle.colorScheme.primary,
        size: style.energyIconSize);
    ref
        .read(expiredTimerControllerProvider)
        .addListenerOnExpired(listenToExpired);
    ref
        .read(expiredTimerControllerProvider)
        .addListenerOnCanceled(listenToCanceled);
  }

  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const LoadingWidget()
        : uid == null
            ? Center(
                child: GoogleSignInButton(
                  onTap: () => signIn(ref),
                  title: translate('signIn'),
                ),
              )
            : LiveStoragePlanListWidget(
                uid: uid,
                // activedPlanId: activedId,
                // previousPlanId: previousId,
                controller: ref.watch(storagePlanListControllerProvider),
                translate: translate,
                energyIcon: energyIcon,
                style: style,
                expiredTimerController:
                    ref.read(expiredTimerControllerProvider),
                currentSubController: ref.watch(currentSubControllerProvider),
                // onRegister: (_) => {},
              );
    // StreamBuilder(
    //     stream: ref.watch(currentSubControllerProvider).dataStream(uid),
    //     builder: (ctx, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       } else if (snapshot.hasData) {
    //         final data = snapshot.requireData;
    //         // final activedId = data == null
    //         //     ? StoragePlanIds.free
    //         //     : data.status == SubscriptionStatus.canceled
    //         //         ? StoragePlanIds.free
    //         //         : data.planId;
    //         // final previousId = data?.planId;
    //         final style = StoragePlanStyleImpl();

    //         return LiveStoragePlanListWidget(
    //           uid: uid,
    //           // activedPlanId: activedId,
    //           // previousPlanId: previousId,
    //           controller: ref.watch(storagePlanListControllerProvider),
    //           translate: translate,
    //           energyIcon: EnergyIcon(
    //               color: lightColorScheme.primary,
    //               size: style.energyIconSize),
    //           style: style,
    //           expiredTimerController:
    //               ref.read(expiredTimerControllerProvider),
    //           currentSubController:
    //               ref.watch(currentSubControllerProvider),
    //           // onRegister: (_) => {},
    //         );
    //       } else {
    //         return const Center(child: SimpleErrorWidget());
    //       }
    //     });
  }

  Future<void> signIn(WidgetRef ref) async {
    await ref.read(signInWithGoogleProvider)();
  }

  Future<bool> listenToExpired(Subscription subscription) async {
    final result = await showDialog<ConfirmResult>(
      context: context,
      builder: (ctx) => ExtendsConfirmDialog(
        subscription: subscription,
        translate: translate,
        energyIcon: energyIcon,
        style: style,
      ),
    );
    if (result == null) {
      await ref
          .read(storagePlanListControllerProvider)
          .makeCurrentSubscriptionExpired(subscription);
    } else if (result.yes) {
      final extendsResult = await ref
          .read(storagePlanListControllerProvider)
          .extendsCurrentSub(subscription);
      if (extendsResult != ExtendsPlanActionResult.success) {
        await ref
            .read(storagePlanListControllerProvider)
            .makeCurrentSubscriptionExpired(subscription);
        return false;
      }
      return true;
    } else {
      await ref
          .read(storagePlanListControllerProvider)
          .makeCurrentSubscriptionExpired(subscription);
    }
    return false;
  }

  Future<void> listenToCanceled(Subscription subscription) async {
    await ref
        .read(storagePlanListControllerProvider)
        .cancelPlan
        .call(subscription);
  }
}
