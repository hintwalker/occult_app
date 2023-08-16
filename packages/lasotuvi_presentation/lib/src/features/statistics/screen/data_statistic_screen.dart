import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_presentation/src/features/storage_plan/usecase/resolve_extends_action_result.dart';
import 'package:lasotuvi_presentation/src/styles/current_plan_style_impl.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_statistic/lasotuvi_statistic.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../auth/user_auth_depended_state.dart';
import '../../navigation/drawer_ids.dart';
import '../../storage_plan/usecase/execute_extends_subscription.dart';

class DataStatisticScreen extends ConsumerStatefulWidget {
  const DataStatisticScreen({super.key});

  @override
  ConsumerState<DataStatisticScreen> createState() =>
      _DataStatisticScreenState();
}

class _DataStatisticScreenState
    extends UserAuthDependedState<DataStatisticScreen> {
  @override
  FutureOr callbackAfterGetUser(String? uid) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(statisticStateNotifierProvider.notifier).fetchData(uid);
    });
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
          : StatisticScreenContent(
              state: ref.watch(statisticStateNotifierProvider),
              translate: translate,
              colorScheme: LasotuviAppStyle.colorScheme,
              currentPlanStyle:
                  CurrentPlanStyleImpl.apply(LasotuviAppStyle.colorScheme),
              showPlans: () =>
                  ref.read(mainDrawerControllerProvider).setScreenId(
                        DrawerIds.storagePlanMarket,
                      ),
              showExtendsConfirm: (subscription) async {
                final result = await executeExtendsSubscription(
                  context: context,
                  subscription: subscription,
                  ref: ref,
                );
                ref
                    .read(statisticStateNotifierProvider.notifier)
                    .fetchData(uid);
                if (context.mounted) {
                  return await resolveExtendsActionResult(
                    context: context,
                    result: result,
                  );
                }
                return false;
              },
            ),
    );
  }
}
