import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_presentation/src/features/energy_market/energy_store_container.dart';
import 'package:lasotuvi_presentation/src/features/storage_plan/usecase/execute_extends_subscription.dart';
import 'package:lasotuvi_presentation/src/styles/current_plan_style_impl.dart';
import 'package:lasotuvi_presentation/src/styles/plan_list_item_style_impl.dart';
import 'package:lasotuvi_presentation/src/styles/subscription_confirm_style_impl.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_auth_widget/tauari_auth_widget.dart';
// import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
// import 'package:tauari_utils/tauari_utils.dart';

import '../auth/user_auth_depended_state.dart';
import '../navigation/drawer_ids.dart';
import 'usecase/resolve_extends_action_result.dart';

class AllStoragePlansBody extends ConsumerStatefulWidget {
  const AllStoragePlansBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AllStoragePlansBodyState();
}

class _AllStoragePlansBodyState
    extends UserAuthDependedState<AllStoragePlansBody> {
  // final subscriptionStyle = SubscriptionConfirmStyleImpl.apply(
  //   LasotuviAppStyle.colorScheme,
  // );
  late Widget energyIcon;
  @override
  FutureOr callbackAfterGetUser(String? uid) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(planListNotifierProvider.notifier).fetchData();
    });
  }
  // @override
  // void dispose() {
  //   ref.read(expiredTimerControllerProvider).cancelAllTimer();
  //   super.dispose();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   energyIcon = EnergyIcon(
  //       color: LasotuviAppStyle.colorScheme.primary,
  //       size: style.energyIconSize);
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     ref
  //         .read(expiredTimerControllerProvider)
  //         .addListenerOnExpired(listenToExpired);
  //     ref
  //         .read(expiredTimerControllerProvider)
  //         .addListenerOnCanceled(listenToCanceled);
  //   });
  // }

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     if (mounted) {
  //       ref.read(expiredTimerControllerProvider).removeListenerOnExpired();
  //       ref.read(expiredTimerControllerProvider).removeListenerOnCanceled();
  //     }
  //   });

  //   super.dispose();
  // }

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
              : PlanListScreenContent(
                  state: ref.watch(planListNotifierProvider),
                  currentPlanStyle: CurrentPlanStyleImpl.apply(
                    LasotuviAppStyle.colorScheme,
                  ),
                  translate: translate,
                  showExtendsConfirm: (subscription) async {
                    final result = await executeExtendsSubscription(
                      context: context,
                      subscription: subscription,
                      ref: ref,
                    );
                    await ref
                        .read(planListNotifierProvider.notifier)
                        .fetchData();
                    if (context.mounted) {
                      return await resolveExtendsActionResult(
                          context: context, result: result);
                    }
                    return false;
                  },
                  itemStyle: PlanListItemStyleImpl.apply(
                    LasotuviAppStyle.colorScheme,
                  ),
                  onSubscribe: (plan) => willSubscribe(context, plan),
                ),
      // : LiveStoragePlanListWidget(
      //     uid: uid,
      //     // activedPlanId: activedId,
      //     // previousPlanId: previousId,
      //     controller: ref.watch(storagePlanListControllerProvider),
      //     translate: translate,
      //     energyIcon: energyIcon,
      //     style: style,
      //     expiredTimerController:
      //         ref.read(expiredTimerControllerProvider),
      //     currentSubController: ref.watch(currentSubControllerProvider),
      //     willSubscribe: (_, plan) => willSubscribe(context, plan),
      //   ),
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
                onBuyMoreEnergy: () async {
                  await showModalBottomSheet(
                    context: ctx,
                    builder: (_) => BasicBottomSheet(
                      title: translate('energyPointMarket'),
                      colorScheme: LasotuviAppStyle.colorScheme,
                      child: const EnergyStoreContainer(),
                    ),
                  );

                  await Future.delayed(Duration.zero);
                  if (ctx.mounted) {
                    Navigator.pop(ctx, false);
                  }
                  if (context.mounted) {
                    willSubscribe(context, plan);
                  }
                }),
          ],
        ),
      );
      if (result == null || !result) {
        return false;
      } else {
        final subscribeResult =
            await ref.read(planListNotifierProvider.notifier).subscribe(plan);
        if (context.mounted) {
          Timer? timer;
          await showDialog(
              context: context,
              builder: (ctx) {
                timer = Timer(const Duration(seconds: 2), () {
                  Navigator.pop(ctx);
                });
                return subscribeResult == SubscribeActionResult.success
                    ? const PaymentSuccessDialog(translate: translate)
                    : const PaymentFailureDialog(translate: translate);
                // return AlertDialog(
                //   title: Text(translate('')),
                //   content: SingleChildScrollView(
                //     child: Text(subscribeResult.name),
                //   ),
                // );
              }).then((val) {
            if (timer?.isActive ?? false) {
              timer?.cancel();
            }
          });
        }
        await ref.read(planListNotifierProvider.notifier).fetchData();
        return true;
      }
    }
    return false;
  }

  Future<void> signIn(WidgetRef ref) async {
    await ref.read(signInWithGoogleProvider)();
  }

//   Future<bool> showExtendsConfirm(Subscription subscription) async {
// final result = await showDialog<ConfirmResult>(
//         context: context,
//         builder: (ctx) => ExtendsConfirmDialog(
//           subscription: subscription,
//           translate: translate,
//           energyIcon: energyIcon,
//           style: style,
//         ),
// );
// return result?.yes ?? false;
//   }

  // Future<bool> listenToExpired(
  //     Subscription subscription, bool openExtendsConfirm) async {
  //   await Future.delayed(const Duration(milliseconds: 200));
  //   if (!mounted) {
  //     return false;
  //   }
  //   if (openExtendsConfirm) {
  //     final result = await showDialog<ConfirmResult>(
  //       context: context,
  //       builder: (ctx) => ExtendsConfirmDialog(
  //         subscription: subscription,
  //         translate: translate,
  //         energyIcon: energyIcon,
  //         iconColor: subscriptionStyle.energyIconColor,
  //         priceValueTextStyle: subscriptionStyle.billingValueTextStyle,
  //         titleStyle: subscriptionStyle.billingTitleTextStyle,
  //       ),
  //     );
  //     if (result == null) {
  //       await ref
  //           .read(storagePlanListControllerProvider)
  //           .makeCurrentSubscriptionExpired(subscription);
  //     } else if (result.yes) {
  //       final extendsResult = await ref
  //           .read(storagePlanListControllerProvider)
  //           .extendsCurrentSub(subscription);
  //       if (extendsResult != ExtendsPlanActionResult.success) {
  //         await ref
  //             .read(storagePlanListControllerProvider)
  //             .makeCurrentSubscriptionExpired(subscription);
  //         return false;
  //       }
  //       return true;
  //     } else {
  //       await ref
  //           .read(storagePlanListControllerProvider)
  //           .makeCurrentSubscriptionExpired(subscription);
  //     }
  //   } else {
  //     await ref
  //         .read(storagePlanListControllerProvider)
  //         .makeCurrentSubscriptionExpired(subscription);
  //   }
  //   return false;
  // }

  // Future<void> listenToCanceled(Subscription subscription) async {
  //   await ref
  //       .read(storagePlanListControllerProvider)
  //       .cancelPlan
  //       .call(subscription);
  // }
}
