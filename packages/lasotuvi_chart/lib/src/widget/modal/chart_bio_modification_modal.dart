import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class ChartBioModificationModal extends StatelessWidget {
  const ChartBioModificationModal({
    super.key,
    required this.chartId,
    required this.syncStatus,
    required this.colorScheme,
    required this.translate,
    required this.onOpenChangeAvatar,
    required this.onOpenChangeName,
    required this.onOpenChangeGender,
    required this.onOpenChangeBirthday,
    required this.onOpenChangeWatchingYear,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final int chartId;
  final String? syncStatus;
  // final Chart chart;
  final void Function(int chartId, String? syncStatus) onOpenChangeAvatar;
  final void Function(int chartId, String? syncStatus) onOpenChangeName;
  final void Function(int chartId, String? syncStatus) onOpenChangeGender;
  final void Function(int chartId, String? syncStatus) onOpenChangeBirthday;
  final void Function(int chartId, String? syncStatus) onOpenChangeWatchingYear;

  @override
  Widget build(BuildContext context) {
    return BasicBottomSheet(
      title: translate('changeInfo'),
      colorScheme: colorScheme,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...ListTile.divideTiles(
              context: context,
              tiles: [
                ListTile(
                  leading: const Icon(Icons.account_box_outlined),
                  title: Text(translate('modifyAvatar')),
                  onTap: () => onOpenChangeAvatar(chartId, syncStatus),
                ),
                ListTile(
                  leading: const Icon(Icons.text_fields),
                  title: Text(translate('modifyChartName')),
                  onTap: () => onOpenChangeName(chartId, syncStatus),
                ),
                ListTile(
                  leading: const Icon(Icons.transgender),
                  title: Text(translate('modifyGender')),
                  onTap: () => onOpenChangeGender(chartId, syncStatus),
                ),
                ListTile(
                  leading: const Icon(Icons.today_outlined),
                  title: Text(translate('modifyBirthday')),
                  onTap: () => onOpenChangeBirthday(chartId, syncStatus),
                ),
                ListTile(
                  leading: const Icon(Icons.visibility_outlined),
                  title: Text(translate('modifyWatchingYear')),
                  onTap: () => onOpenChangeWatchingYear(chartId, syncStatus),
                ),
                // ListTile(
                //   leading: const Icon(Icons.label_outline),
                //   title: Text(translate('tagging')),
                // ),
                // ListTile(
                //   leading: const Icon(Icons.sticky_note_2_outlined),
                //   title: Text(translate('note')),
                // ),
                // const SizedBox(height: 48),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
