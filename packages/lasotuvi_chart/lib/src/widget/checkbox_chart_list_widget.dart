import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

import 'chart_list_item_widget.dart';

class CheckBoxChartListWidget extends StatelessWidget {
  const CheckBoxChartListWidget(
    this.data, {
    super.key,
    this.uid,
    required this.tagId,
    required this.translate,
    required this.colorScheme,
    required this.onItemTap,
    required this.onSubmit,
    required this.onCancel,
  });
  final int tagId;
  final Iterable<ChartHasTags> data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final String? uid;
  final void Function(BuildContext context,
      Iterable<SelectableItem<ChartHasTags>> charts, String? uid) onSubmit;
  final void Function(BuildContext context) onCancel;
  final void Function(BuildContext context, Chart chart, String? uid) onItemTap;

  @override
  Widget build(BuildContext context) {
    return SelectableDataListView<ChartHasTags, SimpleTextGroup>(
      data,
      groupBy: groupBy,
      groupComparator: groupComparator,
      itemBuilder: (item) => ChartListItemWidget(
        item.source,
        uid: uid,
        translate: translate,
        colorScheme: colorScheme,
        onTap: onItemTap,
      ),
      groupSeperatorBuilder: (p0) => Text(p0.label),
      whereTest: whereTest,
      colorScheme: colorScheme,
      translate: translate,
      onCancel: onCancel,
      onSubmit: (context, charts) => onSubmit(context, charts, uid),
      initSelected: (chartHasTags) => chartHasTags.carry
          .where(
            (element) => element.id == tagId,
          )
          .isNotEmpty,
      itemId: (chartHasTags) => chartHasTags.source.id,
      sort: true,
    );
  }

  SimpleTextGroup groupBy(ChartHasTags item) {
    final firstLetter = item.source.name.substring(0, 1);
    return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  }

  int groupComparator(SimpleTextGroup item1, SimpleTextGroup item2) {
    return item1.label.compareTo(item2.label);
  }

  bool whereTest(ChartHasTags item, String query) {
    return item.source.name.toLowerCase().contains(query.trim().toLowerCase());
  }
}
