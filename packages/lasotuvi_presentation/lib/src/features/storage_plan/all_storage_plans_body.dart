import 'package:energy_store/energy_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_presentation/src/features/energy_market/energy_store_container.dart';
import 'package:lasotuvi_presentation/src/styles/subscription_confirm_style_impl.dart';
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
import '../navigation/drawer_ids.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(expiredTimerControllerProvider)
          .addListenerOnExpired(listenToExpired);
      ref
          .read(expiredTimerControllerProvider)
          .addListenerOnCanceled(listenToCanceled);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        ref.read(expiredTimerControllerProvider).removeListenerOnExpired();
        ref.read(expiredTimerControllerProvider).removeListenerOnCanceled();
      }
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        ref.read(mainDrawerControllerProvider).setScreenId(DrawerIds.home);
        return Future.value(false);
      },
      child: findingUid
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
                  willSubscribe: (_, plan) => willSubscribe(context, plan),
                ),
    );
  }

  Future<bool> willSubscribe(BuildContext context, StoragePlan plan) async {
    await ref
        .read(subscriptionConfirmNotifierProvider.notifier)
        .fetchData(uid: uid, nextPlan: plan);
    if (context.mounted) {
      final result = await showDialog<bool>(
        context: context,
        builder: (ctx) => BasicDialog(
          title: translate('confirm'),
          children: [
            SubscriptionConfirmScreenContent(
              state: ref.watch(subscriptionConfirmNotifierProvider),
              translate: translate,
              style: SubscriptionConfirmStyleImpl.apply(
                  LasotuviAppStyle.colorScheme),
              onSubmit: () => Navigator.pop(ctx, true),
              onBuyMoreEnergy: () => showDialog(
                context: ctx,
                builder: (_) => BasicBottomSheet(
                  title: translate('energyPointMarket'),
                  colorScheme: LasotuviAppStyle.colorScheme,
                  child: const EnergyStoreContainer(),
                ),
              ),
            ),
          ],
        ),
      );
      if (result == null || !result) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }

  Future<void> signIn(WidgetRef ref) async {
    await ref.read(signInWithGoogleProvider)();
  }

  Future<bool> listenToExpired(
      Subscription subscription, bool openExtendsConfirm) async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (!mounted) {
      return false;
    }
    if (openExtendsConfirm) {
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
