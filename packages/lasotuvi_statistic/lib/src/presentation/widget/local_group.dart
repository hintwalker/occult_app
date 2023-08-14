import 'package:flutter/material.dart';

import '../state/statistic_state.dart';
import 'local_item.dart';
import 'statistic_title.dart';

class LocalGroup extends StatelessWidget {
  const LocalGroup({
    super.key,
    required this.state,
    required this.translate,
    required this.colorScheme,
  });
  final StatisticState state;
  final String Function(String) translate;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
        ],
      ),
    );
  }
}
