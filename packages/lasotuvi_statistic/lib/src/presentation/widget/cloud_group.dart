import 'package:flutter/material.dart';

import '../state/statistic_state.dart';
import 'cloud_item.dart';
import 'statistic_title.dart';

class CloudGroup extends StatelessWidget {
  const CloudGroup({
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
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
            maxValue: state.usingPlan.limitChart,
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
            maxValue: state.usingPlan.limitTag,
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
            maxValue: state.usingPlan.limitNote,
            colorScheme: colorScheme,
            translate: translate,
          ),
          const SizedBox(
            height: 8.0,
          ),
          // if (state.showUpgradeButton)
          //   FilledButton.icon(
          //     onPressed: showPlans,
          //     icon: const Icon(Icons.upgrade),
          //     label: Text(
          //       translate('upgradeNow'),
          //     ),
          //   ),
          // const SizedBox(
          //   height: 8.0,
          // ),
        ],
      ),
    );
  }
}
