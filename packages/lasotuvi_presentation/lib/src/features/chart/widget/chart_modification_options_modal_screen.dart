import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';

import '../navigation/chart_navigation.dart';

class ChartModificationOptionsModalScreen extends ConsumerWidget {
  const ChartModificationOptionsModalScreen({
    super.key,
    required this.chartId,
    required this.syncStatus,
  });
  final int chartId;
  final String? syncStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ChartBioModificationModal(
      chartId: chartId,
      syncStatus: syncStatus,
      colorScheme: LasotuviAppStyle.colorScheme,
      translate: translate,
      onOpenChangeAvatar: (chartId, syncStatus) =>
          ChartNavigation.openModifyAvatarModal(
        context: context,
        chartId: chartId,
        syncStatus: syncStatus,
      ),
      onOpenChangeName: (chartId, syncStatus) =>
          ChartNavigation.openModifyChartNameModal(
        context: context,
        chartId: chartId,
        syncStatus: syncStatus,
      ),
      onOpenChangeGender: (chartId, syncStatus) =>
          ChartNavigation.openModifyGenderModal(
        context: context,
        chartId: chartId,
        syncStatus: syncStatus,
      ),
      onOpenChangeBirthday: (chartId, syncStatus) =>
          ChartNavigation.openModifyBirthdayModal(
        context: context,
        chartId: chartId,
        syncStatus: syncStatus,
      ),
      onOpenChangeWatchingYear: (chartId, syncStatus) =>
          ChartNavigation.openModifyWatchingYearModal(
        context: context,
        chartId: chartId,
        syncStatus: syncStatus,
      ),
    );
  }

  // final Chart chart;
}
