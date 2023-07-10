import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

import 'chart_list_item_widget.dart';

class SingleSelectableChartListWidget extends StatelessWidget {
  const SingleSelectableChartListWidget(
    this.data, {
    super.key,
    required this.translate,
    required this.colorScheme,
    required this.onItemTap,
    this.uid,
  });

  final Iterable<Chart> data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext, Chart, String? uid) onItemTap;
  final String? uid;

  @override
  Widget build(BuildContext context) {
    return DataListView<Chart, SimpleTextGroup>(
      data,
      groupBy: groupBy,
      itemBuilder: (item) => ChartListItemWidget(
        item,
        uid: uid,
        translate: translate,
        colorScheme: colorScheme,
        onTap: onItemTap,
      ),
      groupSeperatorBuilder: (p0) => BasicGroupSeperatorWidget(
        p0,
        colorScheme: colorScheme,
      ),
      buttons: const [],
      whereTest: whereTest,
      translate: translate,
      slidable: false,
    );
  }

  SimpleTextGroup groupBy(Chart item) {
    final firstLetter = item.name.substring(0, 1);
    return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  }

  bool whereTest(Chart item, String query) {
    return item.name.toLowerCase().contains(query.trim().toLowerCase());
  }
}
