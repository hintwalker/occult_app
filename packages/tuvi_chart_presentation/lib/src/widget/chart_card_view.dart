import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';
import 'package:tuvi_chart_presentation/src/style/chart_card_style.dart';
import 'watching_year.dart';
import 'birth_day.dart';
import 'chart_divider.dart';
import 'chart_name.dart';

class ChartCardView extends UniversalWidget {
  const ChartCardView({
    super.key,
    required super.translate,
    required this.item,
    required this.uid,
    required this.onSyncStatusTap,
    required this.onTap,
    required this.style,
  });
  final Chart item;
  final String? uid;
  final void Function() onSyncStatusTap;
  final void Function(BuildContext context, Chart chart) onTap;
  final ChartCardStyle style;

  @override
  Widget build(BuildContext context) {
    final birthday =
        item.birthday.toMoment(TimeZone(offsetInHour: item.timeZoneOffset));
    return SyncableCardItemScaffold(
      padding: const EdgeInsets.only(right: 12.0),
      uid: uid,
      onlyCloudColor: style.onlyCloudIconColor,
      onlyLocalColor: style.onlyLocalIconColor,
      syncedColor: style.syncedIconColor,
      // colorScheme: colorScheme,
      onItemTap: () => onTap(context, item),
      syncStatus: item.syncStatus,
      onSyncStatusTap: onSyncStatusTap,
      child: Container(
        padding: const EdgeInsets.only(top: 12.0, bottom: 2.0),
        constraints:
            BoxConstraints(minWidth: style.width, maxWidth: style.width),
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
              child: ChartName(
                item.name,
                style: style.name,
              ),
            ),
            ChartDivider(
              width: style.width,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Birthday(
              birthday,
              translate: translate,
              gregorianStyle: style.birthdayGregorian,
              luniSolarStyle: style.birthdayLuniSolar,
            ),
            ChartDivider(
              width: style.width,
            ),
            WatchingYear(
              item.watchingYear,
              translate: translate,
              style: style.watchingYear,
            ),
          ],
        ),
      ),
    );
  }
}
