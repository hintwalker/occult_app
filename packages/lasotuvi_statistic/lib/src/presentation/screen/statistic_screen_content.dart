import 'package:flutter/material.dart';
import 'package:lasotuvi_statistic/src/presentation/widget/cloud_item.dart';
import 'package:lasotuvi_statistic/src/presentation/widget/local_item.dart';
import 'package:lasotuvi_statistic/src/presentation/widget/statistic_title.dart';
import 'package:tauari_ui/tauari_ui.dart';
import '../state/statistic_state.dart';

class StatisticScreenContent extends StatelessWidget {
  const StatisticScreenContent({
    super.key,
    required this.state,
    required this.translate,
    required this.colorScheme,
    required this.showPlans,
  });
  final StatisticState state;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function() showPlans;

  @override
  Widget build(BuildContext context) {
    return state.state == StatisticWorkingState.loading
        ? const LoadingWidget()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StatisticTitle(
                    title: translate('allYourData'),
                    colorScheme: colorScheme,
                    leading: Icon(
                      Icons.devices,
                      color: colorScheme.primary,
                    ),
                  ),
                  LocalItem(
                    leading: Icon(
                      Icons.badge,
                      color: colorScheme.outline,
                    ),
                    title: translate('chart'),
                    value: state.totalChartCount,
                    colorScheme: colorScheme,
                  ),
                  LocalItem(
                    leading: Icon(
                      Icons.label,
                      color: colorScheme.outline,
                    ),
                    title: translate('tag'),
                    value: state.totalTagCount,
                    colorScheme: colorScheme,
                  ),
                  LocalItem(
                    leading: Icon(
                      Icons.sticky_note_2,
                      color: colorScheme.outline,
                    ),
                    title: translate('note'),
                    value: state.totalNoteCount,
                    colorScheme: colorScheme,
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  StatisticTitle(
                    title: translate('dataOnCloud'),
                    colorScheme: colorScheme,
                    leading: Icon(
                      Icons.cloud,
                      color: colorScheme.primary,
                    ),
                  ),
                  CloudItem(
                    leading: Icon(
                      Icons.badge,
                      color: colorScheme.outline,
                    ),
                    title: '${translate('chart')}: ',
                    value: state.cloudChartCount,
                    maxValue: state.maxChartCount,
                    colorScheme: colorScheme,
                    translate: translate,
                  ),
                  CloudItem(
                    leading: Icon(
                      Icons.label,
                      color: colorScheme.outline,
                    ),
                    title: '${translate('tag')}: ',
                    value: state.cloudTagCount,
                    maxValue: state.maxTagCount,
                    colorScheme: colorScheme,
                    translate: translate,
                  ),
                  CloudItem(
                    leading: Icon(
                      Icons.sticky_note_2,
                      color: colorScheme.outline,
                    ),
                    title: '${translate('note')}: ',
                    value: state.cloudNoteCount,
                    maxValue: state.maxNoteCount,
                    colorScheme: colorScheme,
                    translate: translate,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  if (state.showUpgradeButton)
                    FilledButton.icon(
                      onPressed: showPlans,
                      icon: const Icon(Icons.upgrade),
                      label: Text(
                        translate('upgradeNow'),
                      ),
                    )
                ],
              ),
            ),
          );
  }
}
