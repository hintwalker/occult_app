import 'package:energy_store/energy_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
import '../../../styles/storage_plan_style_impl.dart';
import '../../auth/user_auth_depended_state.dart';
import '../../navigation/drawer_ids.dart';

class CurrentSubWidgetContainer extends ConsumerStatefulWidget {
  const CurrentSubWidgetContainer({
    super.key,
    this.uid,
    required this.translate,
  });
  final String? uid;
  final String Function(String) translate;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CurrentSubState();
}

class _CurrentSubState
    extends UserAuthDependedState<CurrentSubWidgetContainer> {
  final style = StoragePlanStyleImpl();
  late Widget energyIcon;
  @override
  void initState() {
    super.initState();
    energyIcon = EnergyIcon(color: LasotuviAppStyle.colorScheme.primary);
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
            ? const SizedBox.shrink()
            : Card(
                child: InkWell(
                  borderRadius: BorderRadius.circular(12.0),
                  onTap: () => ref
                      .read(mainDrawerControllerProvider)
                      .setScreenId(DrawerIds.storagePlanMarket),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LiveCurrentSubWidget(
                        uid: uid,
                        planController:
                            ref.watch(storagePlanListControllerProvider),
                        translate: translate,
                        energyIcon: energyIcon,
                        style: style,
                        timerController:
                            ref.read(expiredTimerControllerProvider),
                        currentSubController:
                            ref.watch(currentSubControllerProvider),
                        navigateToPlanMarket: () => ref
                            .read(mainDrawerControllerProvider)
                            .setScreenId(DrawerIds.storagePlanMarket),
                      )),
                ),
              );
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
        await ref
            .read(storagePlanListControllerProvider)
            .extendsCurrentSub(subscription);
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

  // Future<void> onExpired(Subscription subscription) async {
  //   if (subscription.status == SubscriptionStatus.actived) {
  //     await ref.read(updateCurrentSubProvider)(widget.uid,
  //         subscription.copyWith(status: SubscriptionStatus.expired));
  //     if (kDebugMode) {
  //       print('Save expired');
  //     }
  //   }
  // }

  // Future<void> onCanceled(Subscription subscription) async {
  //   if (subscription.status != SubscriptionStatus.canceled) {
  //     await ref.read(updateCurrentSubProvider)(widget.uid,
  //         subscription.copyWith(status: SubscriptionStatus.canceled));
  //     if (kDebugMode) {
  //       print('Save canceled');
  //     }
  //   }
  // }
}
