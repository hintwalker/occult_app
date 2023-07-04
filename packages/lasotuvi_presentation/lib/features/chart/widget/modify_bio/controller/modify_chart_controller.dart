part of lasotuvi_presentation;

class ModifyChartController extends StateNotifier<bool> {
  ModifyChartController(super.state);

  Future<void> updateChart({
    required BuildContext context,
    required String? uid,
    required Chart chart,
    required WidgetRef ref,
  }) async {
    state = true;
    await ref.read(updateChartProvider)(uid, chart);
    state = false;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.pop();
      }
    });
  }
}

final modifyChartControllerProvider =
    StateNotifierProvider<ModifyChartController, bool>(
        (ref) => ModifyChartController(false));
