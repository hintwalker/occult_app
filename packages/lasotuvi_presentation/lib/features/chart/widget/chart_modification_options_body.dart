part of lasotuvi_presentation;

class ChartEditOptionsBody extends ConsumerWidget {
  const ChartEditOptionsBody({
    super.key,
    required this.chartId,
    required this.syncStatus,
  });
  final int chartId;
  final String? syncStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ChartEditOptionsModal(
      chartId: chartId,
      syncStatus: syncStatus,
      colorScheme: lightColorScheme,
      translate: translate,
      onOpenChangeAvatar: (chartId, syncStatus) =>
          ChartHelper.openModifyAvatarModal(
        context: context,
        chartId: chartId,
        syncStatus: syncStatus,
      ),
      onOpenChangeName: (chartId, syncStatus) =>
          ChartHelper.openModifyChartNameModal(
        context: context,
        chartId: chartId,
        syncStatus: syncStatus,
      ),
      onOpenChangeGender: (chartId, syncStatus) =>
          ChartHelper.openModifyGenderModal(
        context: context,
        chartId: chartId,
        syncStatus: syncStatus,
      ),
      onOpenChangeBirthday: (chartId, syncStatus) =>
          ChartHelper.openModifyBirthdayModal(
        context: context,
        chartId: chartId,
        syncStatus: syncStatus,
      ),
      onOpenChangeWatchingYear: (chartId, syncStatus) {},
    );
  }

  // final Chart chart;
}
