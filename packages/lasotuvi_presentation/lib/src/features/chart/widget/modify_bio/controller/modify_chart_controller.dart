import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:tauari_utils/tauari_utils.dart';

class ModifyChartController extends StateNotifier<bool> {
  ModifyChartController(super.state);

  Future<void> updateChart({
    required BuildContext context,
    required String? uid,
    required Chart chart,
    required WidgetRef ref,
  }) async {
    state = true;
    await ref.read(updateChartProvider)(
      uid,
      chart,
      false,
    );

    state = false;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.pop();
      }
    });
  }

  Future<void> updateAvatar({
    required BuildContext context,
    required String? uid,
    required Chart chart,
    required WidgetRef ref,
  }) async {
    state = true;
    await ref.read(updateChartProvider)(
      uid,
      chart,
      false,
    );
    if (uid != null) {
      if (!(chart.avatar == null || chart.avatar!.isEmpty)) {
        await ref
            .read(uploadAvatarProvider)
            .call(uid, AvatarFile(chart.avatar!));
      }
    }
    state = false;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.pop();
      }
    });
  }
}

final modifyChartControllerProvider =
    StateNotifierProvider.autoDispose<ModifyChartController, bool>(
        (ref) => ModifyChartController(false));
