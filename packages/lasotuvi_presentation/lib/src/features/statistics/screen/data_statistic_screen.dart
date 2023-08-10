import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_statistic/lasotuvi_statistic.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../auth/user_auth_depended_state.dart';
import '../../navigation/drawer_ids.dart';

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
      ref.read(statisticStateNotifierProvider.notifier).fetchData(uid);
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
              showPlans: () =>
                  ref.read(mainDrawerControllerProvider).setScreenId(
                        DrawerIds.storagePlanMarket,
                      ),
            ),
    );
  }
}
