import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tauari_ui/tauari_ui.dart';

import 'hori_chart_birthday_widget.dart';
import 'hori_chart_divider.dart';
import 'hori_chart_name_widget.dart';
import 'hori_chart_watching_year_widget.dart';

class HoriChartItemWidget extends StatelessWidget {
  const HoriChartItemWidget(
    this.item, {
    super.key,
    required this.uid,
    required this.translate,
    required this.colorScheme,
    required this.onSyncStatusTap,
    required this.onTap,
  });
  final Chart item;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final String? uid;
  final void Function() onSyncStatusTap;
  final void Function(BuildContext context, Chart chart) onTap;

  @override
  Widget build(BuildContext context) {
    final birthday =
        item.birthday.toMoment(TimeZone(offsetInHour: item.timeZoneOffset));
    return SyncableCardItemScaffold(
      padding: const EdgeInsets.only(right: 12.0),
      uid: uid,
      onlyCloudColor: colorScheme.outlineVariant,
      onlyLocalColor: colorScheme.outline,
      syncedColor: colorScheme.tertiary,
      // colorScheme: colorScheme,
      onItemTap: () => onTap(context, item),
      syncStatus: item.syncStatus,
      onSyncStatusTap: onSyncStatusTap,
      child: Container(
        padding: const EdgeInsets.only(top: 12.0, bottom: 2.0),
        constraints: const BoxConstraints(minWidth: 120.0, maxWidth: 120.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 48.0,
              height: 48.0,
              child: CircleHumanAvatar(
                gender: item.gender.intValue,
                path: item.avatar,
                size: 48.0,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: HoriChartNameWidget(item.name),
            ),
            const HoriChartDivider(),
            const SizedBox(
              height: 4.0,
            ),
            HoriChartBirthdayWidget(birthday, translate: translate),
            const HoriChartDivider(),
            HoriChartWatchingYearWidget(item.watchingYear,
                translate: translate),
          ],
        ),
      ),
    );
  }
}
