import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';

import '../../../helper/chart_helper.dart';

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
      colorScheme: LasotuviAppStyle.colorScheme,
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
      onOpenChangeWatchingYear: (chartId, syncStatus) =>
          ChartHelper.openModifyWatchingYearModal(
        context: context,
        chartId: chartId,
        syncStatus: syncStatus,
      ),
    );
  }

  // final Chart chart;
}
