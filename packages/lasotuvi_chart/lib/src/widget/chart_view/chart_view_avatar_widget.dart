import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart' show Chart;
import 'package:tauari_ui/tauari_ui.dart';

class ChartViewAvatarWidget extends StatelessWidget {
  const ChartViewAvatarWidget(
    this.chart, {
    super.key,
    this.uid,
    required this.colorScheme,
    required this.openSyncOptions,
  });
  final Chart chart;
  final String? uid;
  final ColorScheme colorScheme;
  final void Function(BuildContext context, Chart chart) openSyncOptions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 192.0,
        height: 192.0,
        child: SyncableItemScaffold(
          colorScheme: colorScheme,
          onSyncStatusTap: () => openSyncOptions(context, chart),
          syncStatus: chart.syncStatus,
          uid: uid,
          child: CircleHumanAvatar(
            gender: chart.gender.intValue,
            path: chart.avatar,
            size: 168,
          ),
        )
        // Stack(
        //   children: [
        //     CircleHumanAvatar(
        //       gender: chart.gender.intValue,
        //       path: chart.avatar,
        //       size: 168,
        //     ),
        //     Positioned(
        //       child: SyncStatusRibbonWidget(
        //         uid: uid,
        //         colorScheme: colorScheme,
        //         syncStatus: chart.syncStatus,
        //         onTap: () => openSyncOptions(context, chart),
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
